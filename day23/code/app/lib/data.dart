// To parse this JSON data, do
//
//     final articles = articlesFromJson(jsonString);

import 'dart:convert';

List<Articles> articlesFromJson(String str) => List<Articles>.from(json.decode(str).map((x) => Articles.fromJson(x)));

String articlesToJson(List<Articles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Articles {
    int id;
    String image;
    String title;
    String date;
    String timeRequired;
    bool isBookmark = false;
    String text;

    Articles({
        required this.id,
        required this.image,
        required this.title,
        required this.date,
        required this.timeRequired,
        required this.isBookmark,
        required this.text,
    });

    factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        date:json["date"],
        timeRequired: json["time_required"],
        isBookmark: json["bookmark"],

        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "date": date,
        "time_required": timeRequired,
        "bookmark": isBookmark,
        "text": text,
    };
}



// json data strore in variable


  final data =   [
  {
    "id": 1,
    "image": "assets/t1.jpg",
    "title": "A Neurologist’s Tips to Protect Your Memory",
    "date": "May 20, 2021",
    "time_required": "15 mins read",
    "bookmark": false,
    "text": "As we age, our memory declines. This is an ingrained assumption for many of us; however, according to neuroscientist Dr. Richard Restak, a neurologist and clinical professor at George Washington Hospital University School of Medicine and Health, decline is not inevitable.\n\n The author of more than 20 books on the mind, Dr. Restak has decades’ worth of experience in guiding patients with memory problems.\n\n “The Complete Guide to Memory: The Science of Strengthening Your Mind,” Dr. Restak’s latest book, includes tools such as mental exercises, sleep habits and diet that can help boost memory.Yet Dr. Restak ventures beyond this familiar territory, considering every facet of memory — how memory is connected to creative thinking, technology’s impact on memory, how memory shapes identity. “The point of the book is to overcome the everyday problems of memory,” Dr. Restak said. \n\n Especially working memory, which falls between immediate recall and long-term memory, and is tied to intelligence, concentration and achievement. According to Dr. Restak, this is the most critical type of memory, and exercises to strengthen it should be practiced daily.  \n\nBut bolstering all memory skills, he added, is key to warding off later memory issues. \n\n decline is not inevitable with aging, Dr. Restak argues in the book. Instead, he points to 10 “sins,” or “stumbling blocks that can lead to lost or distorted memories.” Seven were first described by the psychologist and memory specialist Daniel Lawrence Schacter — “sins of omission,” such as absent-mindedness, and “sins of commission,” such as distorted memories. \n\n To those Dr. Restak added three of his own: technological distortion, technological distraction and depression.Ultimately, “we are what we can remember,” he said. Here are some of Dr. Restak’s tips for developing and maintaining a healthy memory."
  },
  {
    "id": 2,
    "image": "assets/t2.jpeg",
    "title": "A Guide to Getting Rid of Almost Everything",
    "date": "May 20, 2021",
    "time_required": "10 mins read",
    "bookmark": false,
    "text": "Lately, I, a maximalist, have been yearning to be a minimalist.\n\n I am not alone. “People are stuck in their houses and sick of their stuff,” Randy Sabin, who runs estate and Internet sales, told me over the phone from Morris, Connecticut.\n\n “It’s staring them in the face. They have to dust it.” A survey conducted by the storage marketplace Neighbor found that quasi-house arrest has made seventy-eight per cent of respondents realize that they have more possessions than they need.\n\n What to do with this First World surplus? Your children don’t want it. The son of a friend, when offered his pick of items from his grandfather’s estate—an antique clock? an Emmy?—took a toilet plunger. \n\nIn my apartment, it’s got so cluttered that sometimes, when I leave—usually to acquire more stuff—it crosses my mind that I should leave a “Dear Burglar” note, urging the intruder to help herself.A few months ago, I decided to deaccession an assortment of my things by whatever means feasible: selling, donating, recycling, giving them away, losing them on the subway, or reserving a spot for them on the next Mars Explorer.\n\n I gathered my unwanteds and piled them in the living room. A fraction of what was in that jumble: seven antique glass cake stands that belonged to my mother; a dormitory’s worth of new sheet sets and blankets for a bed size that is not mine; a set of Lenox china that my grandmother gave to my mother, who gave it to me, and was never used; clothes galore; a Viking stove grate that arrived cracked, and which I saved because I planned to weld it into a sculpture someday, after I learned how to weld; several rolls of Trump toilet paper that I wrongly thought were amusing a few years ago. I wish I could have added my boyfriend’s too large Le Corbusier lounger.\n\n (There are Web sites, such as NeverLikedItAnyway.com, that will buy your ex’s leavings, ranging from engagement rings to “Rick and Morty” socks.)Some will have you believe that the hardest part of parting with your belongings is choosing which items must go. Not so; saying goodbye is easy. Finding new homes for your stuff is the challenge. \n\nIn December, a Brooklyn woman offered the entire contents of her closet (more than fifty pieces) to her online neighborhood network, much of it gratis. A month later, lots of her clothes were still available. Turns out people prefer cheap to free.."
  },
  {
    "id": 3,
    "image": "assets/t3.jpg",
    "title": "Why you should really stop charging your phone overnight",
    "date": "May 20, 2021",
    "time_required": "20 mins read",
    "bookmark": false,
    "text": "  What's the best way to charge an iPhone to get the longest possible battery life? I asked myself this question and decided to do some experimenting to find out. \n\nBefore going to sleep, I used to do what millions of other people doput my iPhone on to charge overnight.But why do we do this?  Also: Using the wrong USB-C cable can damage your tech.\n\n Here's how to avoid thatAn iPhone can go from zero to 50% charge in about 30 minutes using a 20W charger, and then go to being fully charged in under two hours.Given that an iPhone can charge up so rapidly, it doesn't make sense that we hook it up to a charger for eight hours a day. That works out to a third of its lifetime.Now, Apple has baked Optimized Battery Charging into iOS, which stops the iPhone from charging once the battery hits 80% and only adds the final 20% in time for you to wake up in the morning. But this still means that the iPhone is attached to power all night.And it's still charging, albeit at a slower rate. This is how it stays at 8 Even with the Optimized Battery Charging feature enabled on an iPhone, it's still charging during the night.\n\n Why? Because even when it's just sitting on the nightstand the iPhone is using battery, and it's being topped up to stay at that 80% point. You can observe the charging/discharging on iOS chart by going Settings > Battery.\n\n Leave the iPhone off charge and it will lose charge overnight. When charging with Optimized Battery Charging enabled it will fast charge to 80% and then stay there until the final charge is added. It's only able to stay at that 80% because the battery is being topped up slowly."
    },
  {
    "id": 4,
    "image": "assets/t4.jpg",
    "title": "Your attention didn’t collapse. It was stolen",
    "date": "May 20, 2021",
    "time_required": "12 mins read",
    "bookmark": false,
    "text": "when he was nine years old, my godson Adam developed a brief but freakishly intense obsession with Elvis Presley. He took to singing Jailhouse Rock at the top of his voice with all the low crooning and pelvis-jiggling of the King himself. One day, as I tucked him in, he looked at me very earnestly and asked: “Johann, will you take me to Graceland one day?” Without really thinking, I agreed. \n\nI never gave it another thought, until everything had gone wrong.Ten years later, Adam was lost. He had dropped out of school when he was 15, and he spent almost all his waking hours alternating blankly between screens – a blur of YouTube, WhatsApp and porn. (I’ve changed his name and some minor details to preserve his privacy.)\n\n He seemed to be whirring at the speed of Snapchat, and nothing still or serious could gain any traction in his mind. During the decade in which Adam had become a man, this fracturing seemed to be happening to many of us. Our ability to pay attention was cracking and breaking. I had just turned 40, and wherever my generation gathered, we would lament our lost capacity for concentration. I still read a lot of books, but with each year that passed, it felt more and more like running up a down escalator. Then one evening, as we lay on my sofa, each staring at our own ceaselessly shrieking screens, I looked at him and felt a low dread.\n\n “Adam,” I said softly, “let’s go to Graceland.” I reminded him of the promise I had made. I could see that the idea of breaking this numbing routine ignited something in him, but I told him there was one condition he had to stick to if we went. He had to switch his phone off during the day. He swore he would.."
  }
];

// data to list of object

 

 //// hindi data 
 ///
 ///
 ///
 ///
  final hindi_data =   [
  {
    "id": 1,
    "image": "assets/t1.jpg",
    "title": "आपकी याददाश्त को सुरक्षित रखने के लिए एक न्यूरोलॉजिस्ट की युक्तियाँ",
    "date": "20 मई 2021",
    "time_required": "15 मिनट पढ़ें",
    "bookmark": false,
    "text": "जैसे-जैसे हमारी उम्र बढ़ती है, हमारी याददाश्त कम होती जाती है। यह हममें से कई लोगों के लिए एक अंतर्निहित धारणा है; हालाँकि, जॉर्ज वॉशिंगटन हॉस्पिटल यूनिवर्सिटी स्कूल ऑफ मेडिसिन एंड हेल्थ के न्यूरोलॉजिस्ट और क्लिनिकल प्रोफेसर, न्यूरोसाइंटिस्ट डॉ. रिचर्ड रेस्टक के अनुसार, गिरावट अपरिहार्य नहीं है।\n\nमन पर 20 से अधिक पुस्तकों के लेखक, डॉ. रेस्टक ने स्मृति समस्याओं वाले रोगियों का मार्गदर्शन करने में दशकों का अनुभव।\n\n  “द कम्प्लीट गाइड टू मेमोरी: द साइंस ऑफ स्ट्रेंथेनिंग योर माइंड, “ डॉ. रेस्टक की नवीनतम पुस्तक में मानसिक व्यायाम, नींद की आदतें और आहार जैसे उपकरण शामिल हैं जो मदद कर सकते हैं याददाश्त बढ़ाने में मदद करें। फिर भी डॉ. रेस्टक इस परिचित क्षेत्र से आगे बढ़कर स्मृति के हर पहलू पर विचार करते हैं - कैसे स्मृति रचनात्मक सोच से जुड़ी है, प्रौद्योगिकी का स्मृति पर प्रभाव, स्मृति कैसे पहचान को आकार देती है। डॉ. रेस्टक ने कहा, “पुस्तक का उद्देश्य स्मृति की रोजमर्रा की समस्याओं को दूर करना है।“ \n\n विशेष रूप से कार्यशील स्मृति, जो तत्काल स्मरण और दीर्घकालिक स्मृति के बीच आती है, और बुद्धिमत्ता, एकाग्रता और उपलब्धि से जुड़ी होती है। डॉ. रेस्टक के अनुसार, यह याददाश्त का सबसे महत्वपूर्ण प्रकार है और इसे मजबूत करने के लिए रोजाना व्यायाम करना चाहिए। \n\nलेकिन उन्होंने आगे कहा, सभी स्मृति कौशलों को मजबूत करना, बाद में स्मृति संबंधी समस्याओं से बचने के लिए महत्वपूर्ण है। \n\nउम्र बढ़ने के साथ गिरावट अपरिहार्य नहीं है, डॉ. रेस्टक ने पुस्तक में तर्क दिया है। इसके बजाय, वह 10 “पापों“ या “ठोकरें“ की ओर इशारा करता है जो खोई या विकृत यादें पैदा कर सकता है। सात का वर्णन सबसे पहले मनोवैज्ञानिक और स्मृति विशेषज्ञ डैनियल लॉरेंस शेखर ने किया था - “चूक के पाप“, जैसे कि अनुपस्थित-दिमाग, और “कमीशन के पाप“, जैसे विकृत यादें। \n\nउनमें डॉ. रेस्टक ने अपनी तीन बातें जोड़ीं: तकनीकी विकृति, तकनीकी व्याकुलता और अवसाद। अंततः, “हम वही हैं जो हम याद रख सकते हैं,“ उन्होंने कहा। स्वस्थ स्मृति को विकसित करने और बनाए रखने के लिए डॉ. रेस्टक के कुछ सुझाव यहां दिए गए हैं।"
  },
  {
    "id": 2,
    "image": "assets/t2.jpeg",
    "title": "लगभग हर चीज़ से छुटकारा पाने के लिए एक मार्गदर्शिका",
    "date": "20 मई 2021",
    "time_required": "10 मिनट पढ़ें",
    "bookmark": false,
    "text": "हाल ही में, मैं, एक  अधिकतमवादी, न्यूनतमवादी बनने के लिए उत्सुक रहा हूं। \n\n मैं अकेला नहीं हूं। लोग अपने घरों में फंसे हुए हैं और अपने सामान से परेशान हैं, एस्टेट और इंटरनेट बिक्री चलाने वाले रैंडी सबिन ने मुझे मॉरिस, कनेक्टिकट से फोन पर बताया।\n\n''यह उनके चेहरे पर घूर रहा है। उन्हें इसे धूल चटाना होगा।” स्टोरेज मार्केटप्लेस नेबर द्वारा किए गए एक सर्वेक्षण में पाया गया कि अर्ध-घर की गिरफ्तारी ने 78 प्रतिशत उत्तरदाताओं को यह एहसास कराया है कि उनके पास जरूरत से ज्यादा संपत्ति है।\n\n इस प्रथम विश्व अधिशेष का क्या करें? आपके बच्चे यह नहीं चाहते. एक दोस्त के बेटे ने, जब उसे अपने दादा की संपत्ति से चुनी गई वस्तुओं की पेशकश की - एक प्राचीन घड़ी? एक एमी?—टॉयलेट प्लंजर ले लिया। \n\nमेरे अपार्टमेंट में, यह इतना अव्यवस्थित हो गया है कि कभी-कभी, जब मैं बाहर निकलता हूं - आमतौर पर अधिक सामान खरीदने के लिए - यह मेरे दिमाग में आता है कि मुझे एक “प्रिय चोर“ नोट छोड़ना चाहिए, जिसमें घुसपैठिए से खुद की मदद करने का आग्रह करना चाहिए। कुछ महीने पहले , मैंने जो भी संभव हो, अपनी चीज़ों के वर्गीकरण को समाप्त करने का निर्णय लिया: बेचना, दान करना, पुनर्चक्रण करना, उन्हें दे देना, मेट्रो में उन्हें खो देना, या अगले मंगल एक्सप्लोरर पर उनके लिए एक स्थान आरक्षित करना।\n\n मैंने अपना सामान एकत्र किया अवांछित चीजें और उन्हें लिविंग रूम में ढेर कर दिया। उस गड़बड़ी में जो कुछ था उसका एक अंश: सात प्राचीन कांच के केक स्टैंड जो मेरी माँ के थे; एक शयनगृह के लायक नए चादर सेट और उस बिस्तर के आकार के कंबल जो मेरे नहीं हैं; लेनॉक्स चाइना का एक सेट जो मेरी दादी ने मेरी माँ को दिया था, जिन्होंने इसे मुझे दिया था, और इसका कभी उपयोग नहीं किया गया; प्रचुर मात्रा में कपड़े; एक वाइकिंग स्टोव की जाली जो टूटी हुई थी, और जिसे मैंने बचा लिया क्योंकि मैंने वेल्ड करना सीखने के बाद किसी दिन इसे वेल्ड करके एक मूर्ति बनाने की योजना बनाई थी; ट्रम्प टॉयलेट पेपर के कई रोल जिन्हें मैंने कुछ साल पहले गलत तरीके से मनोरंजक समझा था। काश मैं अपने बॉयफ्रेंड का बहुत बड़ा ले कार्बूज़िए लाउंजर जोड़ पाती।\n\n (नेवरलाइक्डइटएनीवे.कॉम जैसी कई वेबसाइटें हैं, जो आपके पूर्व साथी की बची हुई चीजें खरीद लेंगी, जिसमें सगाई की अंगूठियों से लेकर “रिक और मोर्टी“ मोज़े तक शामिल हैं।) कुछ लोगों का मानना ​​होगा कि अपने सामान को अलग करने का सबसे कठिन हिस्सा यह चुनना है कि कौन सा सामान ले जाना चाहिए। नहीं तो; अलविदा कहना आसान है. अपने सामान के लिए नए घर ढूँढना एक चुनौती है। \n\nदिसंबर में, एक ब्रुकलिन महिला ने अपने ऑनलाइन पड़ोस नेटवर्क को अपनी अलमारी की पूरी सामग्री (पचास से अधिक टुकड़े) की पेशकश की, इसमें से अधिकांश मुफ्त थी। एक महीने बाद, उसके बहुत सारे कपड़े अभी भी उपलब्ध थे। पता चला कि लोग मुफ्त की जगह सस्ता पसंद करते हैं.."
  },
  {
    "id": 3,
    "image": "assets/t3.jpg",
    "title": "आपको वास्तव में अपने फ़ोन को रात भर चार्ज करना क्यों बंद कर देना चाहिए?",
    "date": "20 मई 2021",
    "time_required": "20 मिनट पढ़ें",
    "bookmark": false,
    "text": " सबसे लंबी बैटरी लाइफ पाने के लिए iPhone को चार्ज करने का सबसे अच्छा तरीका क्या है? मैंने खुद से यह सवाल पूछा और इसका पता लगाने के लिए कुछ प्रयोग करने का फैसला किया। \n\nसोने से पहले, मैं वही करता था जो लाखों अन्य लोग मेरे iPhone को रात भर चार्ज करने के लिए करते थे। लेकिन हम ऐसा क्यों करते हैं? इसके अलावा: गलत USB-C केबल का उपयोग करने से आपकी तकनीक खराब हो सकती है।\n\n इससे बचने का तरीका यहां बताया गया है कि 20W चार्जर का उपयोग करके एक iPhone लगभग 30 मिनट में शून्य से 50% चार्ज हो सकता है, और फिर पूरी तरह से चार्ज हो सकता है। दो घंटे। यह देखते हुए कि एक iPhone इतनी तेजी से चार्ज हो सकता है, इसका कोई मतलब नहीं है कि हम इसे दिन में आठ घंटे चार्जर से कनेक्ट करें। यह उसके जीवनकाल के एक तिहाई तक काम करता है। अब, Apple ने iOS में ऑप्टिमाइज्ड बैटरी चार्जिंग को शामिल कर लिया है, जो बैटरी के 80% तक पहुंचने पर iPhone को चार्ज होने से रोक देता है और आपके सुबह उठने के समय में केवल अंतिम 20% जोड़ता है। . लेकिन इसका अभी भी मतलब है कि iPhone पूरी रात बिजली से जुड़ा रहेगा। और यह अभी भी चार्ज हो रहा है, भले ही धीमी गति से। इस तरह यह 8 पर रहता है यहां तक ​​कि iPhone पर अनुकूलित बैटरी चार्जिंग सुविधा सक्षम होने के बावजूद, यह अभी भी रात के दौरान चार्ज होता है।\n\nक्यों? क्योंकि जब यह सिर्फ नाइटस्टैंड पर बैठा होता है तब भी iPhone बैटरी का उपयोग कर रहा होता है, और इसे 80% बिंदु पर बनाए रखने के लिए टॉप अप किया जा रहा है। आप सेटिंग्स > बैटरी पर जाकर iOS चार्ट पर चार्जिंग/डिस्चार्जिंग देख सकते हैं।\n\n iPhone को चार्ज से हटा दें और यह रात भर चार्ज खो देगा। ऑप्टिमाइज़्ड बैटरी चार्जिंग सक्षम होने पर चार्ज करने पर यह तेजी से 80% तक चार्ज हो जाएगा और फिर अंतिम चार्ज जुड़ने तक वहीं रहेगा। यह केवल 80% पर ही टिकने में सक्षम है क्योंकि बैटरी धीरे-धीरे ऊपर जा रही है।"
    },
  {
    "id": 4,
    "image": "assets/t4.jpg",
    "title": "आपका ध्यान नहीं टूटा. यह चोरी हो गया था",
    "date": "20 मई 2021",
    "time_required": "12 मिनट पढ़ें",
    "bookmark": false,
    "text": " जब वह नौ साल का था, मेरे गॉडसन एडम ने एल्विस प्रेस्ली के प्रति एक संक्षिप्त लेकिन अजीब तरह से तीव्र जुनून विकसित किया। उन्होंने अपनी आवाज़ के शीर्ष पर राजा की धीमी आवाज़ और श्रोणि-झटकन के साथ जेलहाउस रॉक गाना शुरू कर दिया। एक दिन, जैसे ही मैंने उसे अपने पास बिठाया, उसने मेरी ओर बहुत गंभीरता से देखा और पूछा: “जोहान, क्या तुम मुझे एक दिन ग्रेस्कलैंड ले जाओगे?“ बिना सोचे-समझे मैं सहमत हो गया। \n\nमैंने इसके बारे में कभी दोबारा नहीं सोचा, जब तक कि सब कुछ गलत नहीं हो गया। दस साल बाद, एडम खो गया। जब वह 15 वर्ष के थे, तब उन्होंने स्कूल छोड़ दिया था, और उन्होंने अपना लगभग पूरा जागने का समय स्क्रीन के बीच खाली समय बिताते हुए बिताया - यूट्यूब, व्हाट्सएप और पोर्न का धुंधलापन। (उसकी गोपनीयता बनाए रखने के लिए मैंने उसका नाम और कुछ छोटी-मोटी जानकारी बदल दी है।)\n\n ऐसा लग रहा था कि वह स्नैपचैट की गति से घूम रहा है, और कोई भी स्थिर या गंभीर बात उसके दिमाग में कोई आकर्षण पैदा नहीं कर सकी। उस दशक के दौरान जब एडम एक आदमी बन गया था, यह फ्रैक्चर हममें से कई लोगों के साथ हो रहा था। हमारी ध्यान देने की क्षमता दरक रही थी और टूट रही थी। मैं अभी 40 साल का हुआ था, और जहां भी मेरी पीढ़ी इकट्ठा होती थी, हम एकाग्रता की अपनी खोई हुई क्षमता पर विलाप करते थे। मैं अभी भी बहुत सारी किताबें पढ़ता हूं, लेकिन हर साल बीतने के साथ, ऐसा महसूस होने लगा कि जैसे मैं नीचे एस्केलेटर पर चढ़ रहा हूं। फिर एक शाम, जब हम अपने सोफे पर लेटे हुए थे, हर कोई अपनी-अपनी लगातार चीखती हुई स्क्रीन को देख रहा था, मैंने उसकी ओर देखा और थोड़ा डर महसूस किया।\n\n“एडम,“ मैंने धीरे से कहा, “चलो ग्रेस्कलैंड चलते हैं।“ मैंने उसे अपना किया हुआ वादा याद दिलाया. मैं देख सकता था कि इस सुन्न कर देने वाली दिनचर्या को तोड़ने के विचार ने उसके अंदर कुछ प्रज्वलित कर दिया था, लेकिन मैंने उससे कहा कि अगर हम जाएंगे तो उसे एक शर्त का पालन करना होगा। उन्हें दिन में अपना फोन बंद करना पड़ा। उसने कसम खाई कि वह.."
  }
];