import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String? selectedTheme = '기본 테마';
  String? selectedSound = '벨소리 1';
  String? selectedVibration = '보통';
  TextEditingController customTimeController = TextEditingController(text: '25');
  TextEditingController customTimeController2 = TextEditingController(text: '5');
  

  final themes = ['기본 테마', '파란 테마', '녹색 테마'];
  final sounds = ['끄기', '벨소리 1', '벨소리 2', '벨소리 3'];
  final vibrations = ['없음', '약함', '보통', '강함'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('화면'),
          _buildCard(
            child: SwitchListTile(
              title: const Text('다크모드'),
              value: isDarkMode,
              onChanged: (val) {
                setState(() => isDarkMode = val);
              },
            ),
          ),
          _buildCard(
            child: ListTile(
              title: const Text('테마 설정'),
              trailing: DropdownButton<String>(
                value: selectedTheme,
                items: themes
                    .map((theme) => DropdownMenuItem(value: theme, child: Text(theme)))
                    .toList(),
                onChanged: (val) {
                  setState(() => selectedTheme = val);
                },
              ),
            ),
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('알림'),
          _buildCard(
            child: ListTile(
              title: const Text('알람 소리'),
              trailing: DropdownButton<String>(
                value: selectedSound,
                items: sounds
                    .map((sound) => DropdownMenuItem(value: sound, child: Text(sound)))
                    .toList(),
                onChanged: (val) {
                  setState(() => selectedSound = val);
                },
              ),
            ),
          ),
          _buildCard(
            child: ListTile(
              title: const Text('진동 정도'),
              trailing: DropdownButton<String>(
                value: selectedVibration,
                items: vibrations
                    .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                    .toList(),
                onChanged: (val) {
                  setState(() => selectedVibration = val);
                },
              ),
            ),
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('타이머'),
          _buildCard(
            child: ListTile(
              title: const Text('집중 시간(분)'),
              subtitle: TextField(
                controller: customTimeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                ),
              ),
            ),
          ),
          _buildCard(
            child: ListTile(
              title: const Text('휴식 시간(분)'),
              subtitle: TextField(
                controller: customTimeController2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),
          _buildSectionTitle('기타'),
          _buildCard(
            child: ListTile(
              title: const Text('오픈소스 라이선스'),
              subtitle: Text(
                '• flutter\n• provider\n• shared_preferences',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          _buildCard(
            child: const ListTile(
              title: Text('앱 버전'),
              trailing: Text('v1.0.0', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }

  // 섹션 제목 (예: 화면, 알림, 타이머 등)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  // 카드 형태의 리스트 항목 UI
  Widget _buildCard({required Widget child}) {
    return Card(
      elevation: 2,//그림자 깊이
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),//카드 모서리 둥글게
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: child,
      ),
    );
  }
}
