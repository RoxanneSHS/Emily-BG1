BEGIN X3EHK3 

CHAIN IF ~IsValidForPartyDialog("X3mily")
Global("X3EHK3Talk","GLOBAL",1)InParty("C0Sirene")~ THEN X3EHK3 AutoAttack 
@46 // ~Strangers, you do not know us, but we are planar hunters, and with you is prey.~
== X3EHK3 @47 // ~Very likely you have been seduced by this tiefling, and perhaps it descends from an Erinyes, or another foul devilish creature.~
== X3EHK3 @48 // ~But fear not. I shall release you from this seduction with death, and shed this creature's blood for the taking.~
DO ~Enemy() ActionOverride("X3EHK2",Enemy())ActionOverride("X3EHK1",Enemy())~
EXIT 

CHAIN IF ~IsValidForPartyDialog("X3mily")
Global("X3EHK3Talk","GLOBAL",1)!InParty("C0Sirene")~ THEN X3EHK3 Cult1
@0 // ~Well, well, what have we here?~ [X3EHK3GR] 
DO ~SetGlobal("X3EHK3Talk","GLOBAL",2)~ 
== X3EHK3 @1 // ~Adventurers, by the looks of it. Sharper looking than most that I've seen come pass.~
END 
++ @2 EXTERN X3EHK3 Cult2  // ~And who are you?~ 
++ @3 EXTERN X3EHK3 Cult3 // ~You're talking to us, I presume.~
++ @4 EXTERN X3EHK3 Cult4 // ~We don't have time for idle chit-chat.~ 

CHAIN X3EHK3 Cult2
@5 // ~We are planar hunters. Hunters of the spawns of demons, devils, celestials, elementals, and other outsiders that have no place in our world.~
== X3EHK3 @6 // ~Demons, Tieflings and Aasimars are our specialty, though the latter are quite rare.~
== X3EHK3 @7 // ~We have a target that is eluding us. But a stranger, an unknown to them, may be able to get the kill.~
END 
+~Global("X3DalTalk","GLOBAL",4)~+ @45 EXTERN X3EHK3 Kill5 // ~That elf Adalgisa told me about you.~
++ @8 EXTERN X3EHK3 Kill1 // ~And you want us to assassinate them?~
++ @9 EXTERN X3EHK3 Kill2 // ~We aren't killers.~ 
++ @10 EXTERN X3EHK3 Kill3 // ~And what do we get for this?~
++ @11 EXTERN X3EHK3 Kill4 // ~Who would be our target?~ 

CHAIN X3EHK3 Kill5 
@35 // ~Another soul seduced by the celestial touched harlot.~
== X3EHK3 @36 // ~Her blood may lay in the secret for great power for the rest of us. Why should one benefit from the power of the planes when it can be spread to all? Cure sickness, and disease?~
== X3milyJ @38 // ~You are sick. Killing innocents for your cause, for increasing your power. People like you deserve swift justice.~
== X3EHK3 @39 // ~Enough talk. Die like the vermin you are.~
DO ~Enemy() ActionOverride("X3EHK2",Enemy())ActionOverride("X3EHK1",Enemy())AddJournalEntry(@100051,QUEST)~
EXIT /* This sets hostile status and quest change. */ 

CHAIN X3EHK3 Cult3 
@12 // ~Unless you are not skilled adventurers, we are.~
EXTERN X3EHK3 Cult2 

CHAIN X3EHK3 Cult4 
@13 // ~Then I will make our business with you quick.~
EXTERN X3EHK3 Cult2 

CHAIN X3EHK3 Kill1 
@14 // ~Naturally.~
EXTERN X3EHK3 Kill4

CHAIN X3EHK3 Kill2 
@15 // ~You have weapons. In some capacity, you have killed, in defense, or for whatever reason you believe was right. You are a killer.~
EXTERN X3EHK3 Kill4 

CHAIN X3EHK3 Kill3 
@16 // ~Gold, the trade and language of most mercenary work.~
EXTERN X3EHK3 Kill4 

CHAIN X3EHK3 Kill4 
@17 // ~Your target should you accept is named Adalgisa, appearing as an elf, but clearly touched by planes. A cunning rogue and archer who has already taken down two of our number alone.~
END 
++ @18 EXTERN X3EHK3 Decline // ~I'm not a murderer. Find someone else to do your dirty work.~
++ @19 EXTERN X3EHK3 Know // ~How do you know she is plane-touched?~
++ @20 EXTERN X3EHK3 Accept // ~I accept. Where should I start my search?~ 

CHAIN X3EHK3 Decline 
@21 // ~How disappointing. I'm sure we'll catch her on our own, either way..~
DO ~AddJournalEntry(@100046,QUEST)~
EXIT 

CHAIN X3EHK3 Know 
@22 // ~We hand our men and women these gems. They are fragile, but when destroyed near the presence of a suspect, it will illuminate them should they be touched by the planes.~
== X3EHK3 @23 // ~Such was the case with this elf. Unfortunately, she proved elusive and escaped her revealer. Now, she is a killer at large.~
END 
++ @20 EXTERN X3EHK3 Accept // ~I accept. Where should I start my search?~ 
++ @18 EXTERN X3EHK3 Decline // ~I'm not a murderer. Find someone else to do your dirty work.~

CHAIN X3EHK3 Accept 
@24 // ~Take this gem, search around the establishments or inns for suspicious elves. When you believe you have found the elf, destroy the gem to determine it, and then strike her down.~
== X3EHK3 @25 // ~Take a vial of her blood as proof. We will know the blood to be true when you bring it.~
DO ~SetGlobal("X3EHK3Talk","GLOBAL",3)GiveItemCreate("X3EGem",Player1,0,0,0)AddJournalEntry(@100047,QUEST)~
EXIT 

CHAIN IF ~IsValidForPartyDialog("X3mily")Global("X3EHK3Talk","GLOBAL",2)~ THEN X3EHK3 SecondCult1 
@442 // ~You return. Do you change your mind?~
END 
++ @20 EXTERN X3EHK3 Accept // ~I accept. Where should I start my search?~ 
+~GlobalGT("X3DalTalk","GLOBAL",2)~+ @26 EXTERN X3EHK3 Truth // ~I know the truth and understand your real motives. The elf told me everything.~
+~Global("X3DalReveal","GLOBAL",1)~+ @27 EXTERN X3milyJ Betray // ~I have someone else you would be interested in.~ /* This appears IF they used the gem. This shouldn't appear if Emily's mother is still alive. */ 
+~Dead("X3dal")PartyHasItem("X3EBLOOD")~+ @42 EXTERN X3EHK3 Complete // ~I found the elf you spoke of, and decided to kill her after all.~
++ @49 EXIT // ~I remain disinterested. Good day.~

CHAIN X3milyJ Betray 
@28 // ~<CHARNAME>? What...what are you saying?
END 
++ @29 EXTERN X3EHK3 BetrayCommit // ~Your reward is greater than the value of your company. Take her life, she is planetouched.~

CHAIN X3EHK3 BetrayCommit 
@30 // ~An interesting turn of events. Here is your reward for bringing a plane touched to me. Now, kill her.~
== X3milyJ @31 // ~You bastard! I'm not going down without a fight!~ 
DO ~GiveGoldForce(1000)ActionOverride("X3mily", LeaveParty())ActionOverride("X3mily", Enemy())SetGlobal("X3AttackEmily","GLOBAL",1)AddexperienceParty(6000)AddJournalEntry(@100049,QUEST_DONE)~
EXIT /*Emily leaves the party, turns hostile, and attacks the nearest person. Quest concludes, Emily's mother vanishes if not already killed.*/

CHAIN X3EHK3 Complete 
@32 // ~Good work. Here is your reward. We planar hunters appreciate what you have done today. One less manipulative outsider in our world.~
DO ~GiveGoldForce(1000)ActionOverride(Player1,DestroyItem("X3EBLOOD"))~
END /*Reward them, then the PC can also betray them.*/
+~Global("X3DalReveal","GLOBAL",1)~+ @27 EXTERN X3milyJ Betray // ~I have someone else you would be interested in.~ /* This appears IF they used the gem.*/ 
++ @33 EXTERN X3EHK3 Depart // ~I'll be on my way then.~

CHAIN X3EHK3 Depart 
@34 // ~May the outer planes fear your step.~
DO ~SetGlobal("X3milySixthTalk","GLOBAL",1)EscapeArea()AddJournalEntry(@100050,QUEST_DONE)AddexperienceParty(9000)ActionOverride("X3EHK2",EscapeArea())ActionOverride("X3EHK1",EscapeArea())~
EXIT 

CHAIN X3EHK3 Truth 
@35 // ~Another soul seduced by the celestial touched harlot.~
== X3EHK3 @36 // ~Her blood may lay in the secret for great power for the rest of us. Why should one benefit from the power of the planes when it can be spread to all? Cure sickness, and disease?~
== X3EHK3 @37 // ~A pity you did not listen like most blockhead mercenaries would. Now you must die, and we will have to do the job ourselves.~
== X3milyJ @38 // ~You are sick. Killing innocents for your cause, for increasing your power. People like you deserve swift justice.~
== X3EHK3 @39 // ~Enough talk. Die like the vermin you are.~
DO ~Enemy() ActionOverride("X3EHK2",Enemy())ActionOverride("X3EHK1",Enemy())AddJournalEntry(@100051,QUEST)~
EXIT /* This sets hostile status and quest change. */ 

CHAIN IF ~IsValidForPartyDialog("X3mily")Global("X3EHK3Talk","GLOBAL",3)~ THEN X3EHK3 ThirdCult1
@40 // ~Is the job done?~
END 
+~GlobalGT("X3DalTalk","GLOBAL",2)~+ @26 EXTERN X3EHK3 Truth // ~I know the truth and understand your real motives. The elf told me everything.~
+~Global("X3DalReveal","GLOBAL",1)~+ @27 EXTERN X3milyJ Betray // ~I have someone else you would be interested in.~ /* This appears IF they used the gem. This shouldn't appear if Emily's mother is still alive. */ 
+~Dead("X3dal")PartyHasItem("X3EBLOOD")~+ @41 EXTERN X3EHK3 Complete // ~She's dead.~
+~!Dead("X3dal")!PartyHasItem("X3EBLOOD")~+ @43 EXTERN X3EHK3 NotComplete // ~I have not yet killed and retrieved her blood.~

CHAIN X3EHK3 NotComplete 
@44 // ~Do not forget the blood as proof. Quickly now, before the elf becomes aware of your hiring from us.~
EXIT 