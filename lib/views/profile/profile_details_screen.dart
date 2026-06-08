import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/data/models/response_model/auth/user_data_model.dart';
import 'package:santvani_app/data/repository/user_repo.dart';
import 'package:santvani_app/helper/pref_helper/shared_pref_helper.dart';
import 'package:santvani_app/theme/app_colors.dart';
import 'package:santvani_app/theme/font_styles.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final UserDataModel? user = SharedPreferenceHelper().user;
    _nameController = TextEditingController(text: user?.fullName ?? '');
    _usernameController = TextEditingController(text: user?.username ?? '');
    _bioController = TextEditingController(text: user?.bio ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final UserRepo userRepo = context.read<UserRepo>();
    final result = await userRepo.updateProfileApi(
      fullName: _nameController.text.trim(),
      username: _usernameController.text.trim(),
      bio: _bioController.text.trim(),
    );

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      result.fold(
        (final failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.colorError500,
              content: Text(failure.message ?? 'Failed to update profile'),
            ),
          );
        },
        (final updatedUser) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xFFE65100),
              content: Text('Profile updated successfully! 🌸🙏'),
            ),
          );
          Navigator.pop(context);
        },
      );
    }
  }

  Widget _buildTextField({
    required final String label,
    required final TextEditingController controller,
    required final IconData icon,
    final String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: dMSansW700.copyWith(fontSize: 13, color: const Color(0xFFE65100)),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFFCC80), width: 0.8),
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            style: dMSansW500.copyWith(fontSize: 14, color: AppColors.colorNeutral900),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: const Color(0xFFE65100), size: 20),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReadOnlyRow(final String label, final String value, final IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFE0B2), width: 0.8),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: const Color(0xFFFF9933), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: dMSansW500.copyWith(fontSize: 11, color: AppColors.colorNeutral500),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: dMSansW700.copyWith(fontSize: 13.5, color: AppColors.colorNeutral800),
                ),
              ],
            ),
          ),
          const Icon(Icons.lock_outline_rounded, color: AppColors.colorNeutral400, size: 16),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final UserDataModel? user = SharedPreferenceHelper().user;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.8,
        shadowColor: const Color(0xFFFF9933).withValues(alpha: 0.15),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFE65100)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Profile',
          style: dMSansW700.copyWith(
            color: const Color(0xFFE65100),
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTextField(
                    label: 'Full Name',
                    controller: _nameController,
                    icon: Icons.person_outline_rounded,
                    validator: (final val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Full name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  _buildTextField(
                    label: 'Username',
                    controller: _usernameController,
                    icon: Icons.alternate_email_rounded,
                    validator: (final val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Username cannot be empty';
                      }
                      if (val.trim().length < 3) {
                        return 'Username must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  _buildTextField(
                    label: 'Bio',
                    controller: _bioController,
                    icon: Icons.edit_note_rounded,
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Private Information',
                    style: dMSansW700.copyWith(fontSize: 13, color: AppColors.colorNeutral500),
                  ),
                  const SizedBox(height: 8),
                  _buildReadOnlyRow('Email Address', user?.emailId ?? 'N/A', Icons.mail_outline_rounded),
                  const SizedBox(height: 12),
                  _buildReadOnlyRow('Mobile Number', user?.mobileNumber ?? 'N/A', Icons.phone_android_rounded),
                  const SizedBox(height: 48),
                  GestureDetector(
                    onTap: _isLoading ? null : _saveProfile,
                    child: Container(
                      height: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE65100),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: const Color(0xFFE65100).withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.white,
                              ),
                            )
                          : Text(
                              'Save Changes',
                              style: dMSansW700.copyWith(fontSize: 14, color: AppColors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.05),
              child: const SizedBox.expand(),
            ),
        ],
      ),
    );
  }
}
