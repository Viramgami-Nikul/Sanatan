const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
const {getMessaging} = require("firebase-admin/messaging");
const {
  onValueCreated,
} = require("firebase-functions/v2/database");
const logger = require("firebase-functions/logger");

initializeApp();

exports.sendChatNotification = onValueCreated(
    "/chats/{chatRoomId}/messages/{messageId}",
    async (event) => {
      const messageData = event.data.val();

      if (!messageData) {
        logger.info("No message data found");
        return null;
      }

      const senderId = messageData.senderId;
      const receiverId = messageData.receiverId;
      const messageText = messageData.message || "";
      const imageUrl = messageData.imageUrl;

      logger.info(
          `New message from ${senderId} to ${receiverId}`,
      );

      try {
        const db = getFirestore();

        const receiverDoc = await db
            .collection("users")
            .doc(receiverId)
            .get();

        if (!receiverDoc.exists) {
          logger.info(
              `Receiver user document not found for UID: ${receiverId}`,
          );
          return null;
        }

        const fcmToken = receiverDoc.data().fcm_token;

        if (!fcmToken) {
          logger.info(
              `Receiver FCM token not found for UID: ${receiverId}`,
          );
          return null;
        }

        const senderDoc = await db
            .collection("users")
            .doc(senderId)
            .get();

        const senderName = senderDoc.exists ?
        (
          senderDoc.data().full_name ||
          senderDoc.data().name ||
          "New Message"
        ) :
        "New Message";

        const bodyText = imageUrl ?
        "📷 Photo" :
        messageText;

        const payload = {
          token: fcmToken,
          notification: {
            title: senderName,
            body: bodyText,
          },
          data: {
            type: "chat",
            chatRoomId: event.params.chatRoomId,
            senderId: senderId,
          },
          android: {
            priority: "high",
            notification: {
              sound: "default",
              clickAction: "FLUTTER_NOTIFICATION_CLICK",
            },
          },
          apns: {
            payload: {
              aps: {
                sound: "default",
                badge: 1,
              },
            },
          },
        };

        const response = await getMessaging().send(payload);

        logger.info(
            `Successfully sent FCM message: ${response}`,
        );

        return response;
      } catch (error) {
        logger.error(
            "Error fetching data or sending FCM message:",
            error,
        );

        return null;
      }
    },
);
