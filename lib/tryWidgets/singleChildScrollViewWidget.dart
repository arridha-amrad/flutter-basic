import 'package:flutter/material.dart';

class SingleChildScollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Child Scroll View"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Container(
                    // A fixed-height child.
                    color: const Color(0xffeeee00), // Yellow
                    height: 120.0,
                    alignment: Alignment.center,
                    child: const Text('Fixed Height Content'),
                  ),
                  Expanded(
                    child: Container(
                        // Another fixed-height child.
                        color: const Color(0xff008000), // Green
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Text('Fixed Height Content')),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
