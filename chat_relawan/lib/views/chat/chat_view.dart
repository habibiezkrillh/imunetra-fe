import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants.dart';
import '../../../bloc/chat_bloc.dart';
import '../../../bloc/chat_state.dart';
import '../../../bloc/chat_event.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Pesan',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildFilterTabs(context),
              const SizedBox(height: 16),
              Expanded(child: _buildChatList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Silahkan Mencari..',
        hintStyle: const TextStyle(
          fontFamily: kFontFamily,
          fontSize: 14,
          color: Colors.grey,
        ),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabButton(context, "Semua", 0, state.selectedIndex),
            _buildTabButton(context, "Belum Dibaca", 1, state.selectedIndex),
            _buildTabButton(context, "Perusahaan Kerjasama", 2, state.selectedIndex),
          ],
        );
      },
    );
  }

  Widget _buildTabButton(BuildContext context, String text, int index, int selectedIndex) {
    final bool isSelected = selectedIndex == index;
    return ElevatedButton(
      onPressed: () {
        context.read<ChatBloc>().add(ChangeTabEvent(index));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? kPrimaryColor : Colors.grey.shade200,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontFamily: kFontFamily),
      ),
    );
  }

  Widget _buildChatList(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final List<String> names = ["Astra", "Telkom", "Alfamart"];
        final List<String> companies = [
          "Leonard",
          "Aurel",
          "Habbibie"
        ];
        final List<String> times = ["10:00", "09:00", "08:55"];

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/profile.jpg'), // Placeholder
            radius: 24,
          ),
          title: Text(
            names[index],
            style: const TextStyle(
              fontFamily: kFontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Halo, boleh tahu lebih dalam mengenai acaranya?",
            style: const TextStyle(fontFamily: kFontFamily),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                times[index],
                style: const TextStyle(fontFamily: kFontFamily),
              ),
              const SizedBox(height: 8),
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: kFontFamily,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
