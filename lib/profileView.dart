import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  final screens = [];
  
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Center(
        child: Column(
          children: [
            
            Form(
             
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          isDense: true, // Reduces height a bit
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none, // No border
                            borderRadius: BorderRadius.circular(
                                12), // Apply corner radius
                          ),
                          prefixIcon: const Icon(Icons.mail_rounded, size: 24)),
                     
                   
                      
                    ),
                   
                    
                      ],
                    ),
              ),  
                
                ),
              
            
           
          ],
     ) );
  }
}
