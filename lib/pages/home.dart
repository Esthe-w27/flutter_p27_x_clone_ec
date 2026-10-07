import 'package:flutter/material.dart';
import 'login_page.dart';
import '../models/tweet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Image.asset('assets/x-logo.png', height: 30),
          leading: Center(
            child: CircleAvatar(
              radius: 16,
              foregroundImage: NetworkImage('assets/avatar-icon.png'),
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                overlayColor: Colors.white54,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.blue,
            overlayColor: WidgetStatePropertyAll(Color.fromARGB(19, 160, 160, 160)), 
            splashBorderRadius: BorderRadius.all(Radius.circular(30)),
            tabs: [
              Tab(text: 'Pour vous'),
              Tab(text: 'Abonnements'),
            ],
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.white54,
            dividerColor: Colors.white54,
            dividerHeight: 0.5,
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                final tweet = Tweet.sampleTweets[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(tweet.profilePictureUrl),
                  ),
                  title: Row(
                    children: [
                      Text(tweet.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      if (tweet.verified)
                        const Icon(Icons.check_circle, color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      Text(tweet.handle, style: const TextStyle(color: Colors.white54)),
                      const SizedBox(width: 4),
                      Text('· ${tweet.time}', style: const TextStyle(color: Colors.white54)),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(tweet.content, style: const TextStyle(color: Colors.white)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(static const IconData comment = IconData(0xe17e, fontFamily: 'MaterialIcons'), tweet.comments),
                          Text(static const IconData repeat_on = IconData(0xe520, fontFamily: 'MaterialIcons'), tweet.retweets),
                          Text(static const IconData favorite_border = IconData(0xe858, fontFamily: 'MaterialIcons'), tweet.likes),
                          Text(static const IconData remove_red_eye_outlined = IconData(0xe417, fontFamily: 'MaterialIcons'), tweet.views),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Center(
              child: Text('Abonnements', style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}