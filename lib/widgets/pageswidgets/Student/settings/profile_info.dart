import 'package:flutter/material.dart';
import 'common/custom_input_field.dart';

class ProfileInfo extends StatefulWidget {
  final Color textColor;
  final Color secondaryTextColor;
  final bool isEditing;
  final Function(bool) onChanged;

  const ProfileInfo({
    Key? key,
    required this.textColor,
    required this.secondaryTextColor,
    required this.isEditing,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'John Smith');
    _emailController = TextEditingController(text: 'john@edu.com');
    _phoneController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800]! : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isDarkMode
            ? []
            : [
                const BoxShadow(
                  color: Color(0x40000000),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
      ),
      child: Column(
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 20),
          _buildProfileDetails(),
          const SizedBox(height: 20),
          _buildInputFields(isDarkMode),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: constraints.maxWidth > 600
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/TEMP/2971c92db0b3683dfae7b0780bb3ceafd696c7cd',
                    width: 156,
                    height: 155,
                    fit: BoxFit.cover,
                  ),
                ),
                if (constraints.maxWidth > 600) const SizedBox(width: 61),
                if (constraints.maxWidth > 600)
                  widget.isEditing
                      ? SizedBox(
                          width: 200,
                          child: TextField(
                            controller: _nameController,
                            onChanged: (_) => widget.onChanged(false),
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      : Text(
                          _nameController.text,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
              ],
            ),
            if (constraints.maxWidth <= 600)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: widget.isEditing
                    ? SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _nameController,
                          onChanged: (_) => widget.onChanged(true),
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Text(
                        _nameController.text,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildProfileDetails() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 252),
      child: Column(
        children: [
          _buildDetailRow('ID:', ['ADM2024001']),
          const SizedBox(height: 12),
          _buildDetailRow('Role:', ['Student']),
          const SizedBox(height: 12),
          _buildDetailRow('Department:', ['Computer Science']),
          const SizedBox(height: 12),
          _buildDetailRow('Join Date:', ['2024-01-15']),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, List<String> values) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        ...values
            .map((value) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: widget.secondaryTextColor,
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildInputFields(bool isDarkMode) {
    final labelColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      children: [
        CustomInputField(
          label: 'Full Name',
          type: TextInputType.text,
          labelColor: labelColor,
          controller: _nameController,
          isEditing: widget.isEditing,
          onChanged: (_) =>
              widget.onChanged(true), // Pass the appropriate boolean value
        ),
        const SizedBox(height: 20),
        CustomInputField(
          label: 'Email Address',
          type: TextInputType.emailAddress,
          labelColor: labelColor,
          controller: _emailController,
          isEditing: widget.isEditing,
          onChanged: (_) =>
              widget.onChanged(true), // Pass the appropriate boolean value
        ),
        const SizedBox(height: 20),
        CustomInputField(
          label: 'Phone Number',
          type: TextInputType.phone,
          labelColor: labelColor,
          controller: _phoneController,
          isEditing: widget.isEditing,
          onChanged: (_) =>
              widget.onChanged(true), // Pass the appropriate boolean value
        ),
      ],
    );
  }
}
