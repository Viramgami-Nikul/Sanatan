import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:santvani_app/components/bottom_sheet/create_options_bottom_sheet.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFCF8F2),
      elevation: 0,
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFFFF9933), // Saffron
                Color(0xFFFF5722), // Deep Orange
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: const Color(0xFFFF5722).withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  useRootNavigator: true,
                  isScrollControlled: true,
                  builder: (final BuildContext ccontext) => const CreateOptionsBottomSheet(),
                );
              },
              child: const Icon(
                Icons.add_rounded,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.spa_rounded, // Serene Lotus icon
            size: 20,
            color: Color(0xFFE65100),
          ),
          const SizedBox(width: 6),
          Text(
            'Santvani',
            style: GoogleFonts.grandHotel(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFE65100), // Divine Saffron
              letterSpacing: 1.0,
              shadows: <Shadow>[
                Shadow(
                  color: const Color(0xFFFFCC80).withValues(alpha: 0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 16,
            color: Color(0xFFE65100),
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 14.0, top: 8.0, bottom: 8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFFF3E0), // Warm pale orange
              border: Border.all(
                color: const Color(0xFFFFCC80),
                width: 1.5,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.favorite_rounded,
                    size: 18,
                    color: Color(0xFFE65100),
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB300), // Glowing Gold
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFFFB300).withValues(alpha: 0.8),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: Container(
          height: 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFFFD700), // Gold
                Color(0xFFFF9933), // Saffron
                Color(0xFFFF3300), // Divine Vermilion
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}
