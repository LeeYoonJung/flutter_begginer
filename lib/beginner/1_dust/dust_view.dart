import 'package:flutter/material.dart';

class DustView extends StatefulWidget {
  const DustView({Key? key}) : super(key: key);

  @override
  State<DustView> createState() => _DustViewState();
}

class _DustViewState extends State<DustView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '현재 위치 미세먼지',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('얼굴사진'),
                          Text(
                            '80',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            '보통',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Text('이미지'),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                '11',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Text('습도 100'),
                          const Text('풍속 5.7m/s'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                    backgroundColor: Colors.orange,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
