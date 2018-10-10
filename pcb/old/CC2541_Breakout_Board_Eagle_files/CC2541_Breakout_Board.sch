<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="texas">
<description>&lt;b&gt;Texas Instruments Devices&lt;/b&gt;&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="QFN40-6X6">
<description>&lt;b&gt;RHA (S-PQFP-N40) 6 x 6 mm&lt;/b&gt;&lt;p&gt;
Source: http://focus.ti.com/lit/ds/symlink/tps65020.pdf</description>
<wire x1="-3.025" y1="3.025" x2="3.025" y2="3.025" width="0.1016" layer="51"/>
<wire x1="3.025" y1="3.025" x2="3.025" y2="-3.025" width="0.1016" layer="51"/>
<wire x1="3.025" y1="-3.025" x2="-3.025" y2="-3.025" width="0.1016" layer="51"/>
<wire x1="-3.025" y1="-3.025" x2="-3.025" y2="3.025" width="0.1016" layer="51"/>
<wire x1="-3.025" y1="3.025" x2="-2.725" y2="3.025" width="0.1016" layer="21"/>
<wire x1="-3.025" y1="2.725" x2="-3.025" y2="3.025" width="0.1016" layer="21"/>
<wire x1="3.025" y1="3.025" x2="3.025" y2="2.725" width="0.1016" layer="21"/>
<wire x1="-2.725" y1="-3.025" x2="-3.025" y2="-3.025" width="0.1016" layer="21"/>
<wire x1="3.025" y1="-3.025" x2="2.725" y2="-3.025" width="0.1016" layer="21"/>
<wire x1="-3.025" y1="-3.025" x2="-3.025" y2="-2.725" width="0.1016" layer="21"/>
<wire x1="2.725" y1="3.025" x2="3.025" y2="3.025" width="0.1016" layer="21"/>
<wire x1="3.025" y1="-2.725" x2="3.025" y2="-3.025" width="0.1016" layer="21"/>
<circle x="-2.7" y="2.25" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="2.25" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="1.75" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="1.75" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="1.25" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="1.25" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="0.75" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="0.75" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="0.25" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="0.25" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="-0.25" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="-0.25" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="-0.75" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="-0.75" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="-1.25" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="-1.25" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="-1.75" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="-1.75" radius="0.125" width="0" layer="31"/>
<circle x="-2.7" y="-2.25" radius="0.2" width="0" layer="29"/>
<circle x="-2.7" y="-2.25" radius="0.125" width="0" layer="31"/>
<circle x="-2.25" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="-2.25" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="-1.75" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="-1.75" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="-1.25" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="-1.25" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="-0.75" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="-0.75" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="-0.25" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="-0.25" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="0.25" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="0.25" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="0.75" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="0.75" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="1.25" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="1.25" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="1.75" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="1.75" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="2.25" y="-2.7" radius="0.2" width="0" layer="29"/>
<circle x="2.25" y="-2.7" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="-2.25" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="-2.25" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="-1.75" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="-1.75" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="-1.25" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="-1.25" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="-0.75" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="-0.75" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="-0.25" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="-0.25" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="0.25" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="0.25" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="0.75" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="0.75" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="1.25" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="1.25" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="1.75" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="1.75" radius="0.125" width="0" layer="31"/>
<circle x="2.7" y="2.25" radius="0.2" width="0" layer="29"/>
<circle x="2.7" y="2.25" radius="0.125" width="0" layer="31"/>
<circle x="2.25" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="2.25" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="1.75" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="1.75" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="1.25" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="1.25" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="0.75" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="0.75" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="0.25" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="0.25" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="-0.25" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="-0.25" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="-0.75" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="-0.75" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="-1.25" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="-1.25" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="-1.75" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="-1.75" y="2.7" radius="0.125" width="0" layer="31"/>
<circle x="-2.25" y="2.7" radius="0.2" width="0" layer="29"/>
<circle x="-2.25" y="2.7" radius="0.125" width="0" layer="31"/>
<pad name="EXP@1" x="-1.525" y="1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@2" x="-0.5" y="1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@3" x="0.5" y="1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@4" x="1.525" y="1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@5" x="-1.525" y="0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@6" x="-0.5" y="0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@7" x="0.5" y="0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@8" x="1.525" y="0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@9" x="-1.525" y="-0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@10" x="-0.5" y="-0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@11" x="0.5" y="-0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@12" x="1.525" y="-0.475" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@13" x="-1.525" y="-1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@14" x="-0.5" y="-1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@15" x="0.5" y="-1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<pad name="EXP@16" x="1.525" y="-1.525" drill="0.3" diameter="1.1" shape="square" stop="no"/>
<smd name="1" x="-3.025" y="2.25" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="2" x="-3.025" y="1.75" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="3" x="-3.025" y="1.25" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="4" x="-3.025" y="0.75" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="5" x="-3.025" y="0.25" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="6" x="-3.025" y="-0.25" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="7" x="-3.025" y="-0.75" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="8" x="-3.025" y="-1.25" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="9" x="-3.025" y="-1.75" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="10" x="-3.025" y="-2.25" dx="0.95" dy="0.28" layer="1" roundness="100" stop="no" cream="no"/>
<smd name="11" x="-2.25" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="12" x="-1.75" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="13" x="-1.25" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="14" x="-0.75" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="15" x="-0.25" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="16" x="0.25" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="17" x="0.75" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="18" x="1.25" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="19" x="1.75" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="20" x="2.25" y="-3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R90" stop="no" cream="no"/>
<smd name="21" x="3.025" y="-2.25" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="22" x="3.025" y="-1.75" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="23" x="3.025" y="-1.25" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="24" x="3.025" y="-0.75" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="25" x="3.025" y="-0.25" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="26" x="3.025" y="0.25" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="27" x="3.025" y="0.75" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="28" x="3.025" y="1.25" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="29" x="3.025" y="1.75" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="30" x="3.025" y="2.25" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R180" stop="no" cream="no"/>
<smd name="31" x="2.25" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="32" x="1.75" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="33" x="1.25" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="34" x="0.75" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="35" x="0.25" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="36" x="-0.25" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="37" x="-0.75" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="38" x="-1.25" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="39" x="-1.75" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<smd name="40" x="-2.25" y="3.025" dx="0.95" dy="0.28" layer="1" roundness="100" rot="R270" stop="no" cream="no"/>
<text x="-2.9" y="3.99" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.9" y="-5.44" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.4" y1="2.05" x2="-2.7" y2="2.45" layer="29"/>
<rectangle x1="-3.375" y1="2.125" x2="-2.7" y2="2.375" layer="31"/>
<rectangle x1="-3.4" y1="1.55" x2="-2.7" y2="1.95" layer="29"/>
<rectangle x1="-3.375" y1="1.625" x2="-2.7" y2="1.875" layer="31"/>
<rectangle x1="-3.4" y1="1.05" x2="-2.7" y2="1.45" layer="29"/>
<rectangle x1="-3.375" y1="1.125" x2="-2.7" y2="1.375" layer="31"/>
<rectangle x1="-3.4" y1="0.55" x2="-2.7" y2="0.95" layer="29"/>
<rectangle x1="-3.375" y1="0.625" x2="-2.7" y2="0.875" layer="31"/>
<rectangle x1="-3.4" y1="0.05" x2="-2.7" y2="0.45" layer="29"/>
<rectangle x1="-3.375" y1="0.125" x2="-2.7" y2="0.375" layer="31"/>
<rectangle x1="-3.4" y1="-0.45" x2="-2.7" y2="-0.05" layer="29"/>
<rectangle x1="-3.375" y1="-0.375" x2="-2.7" y2="-0.125" layer="31"/>
<rectangle x1="-3.4" y1="-0.95" x2="-2.7" y2="-0.55" layer="29"/>
<rectangle x1="-3.375" y1="-0.875" x2="-2.7" y2="-0.625" layer="31"/>
<rectangle x1="-3.4" y1="-1.45" x2="-2.7" y2="-1.05" layer="29"/>
<rectangle x1="-3.375" y1="-1.375" x2="-2.7" y2="-1.125" layer="31"/>
<rectangle x1="-3.4" y1="-1.95" x2="-2.7" y2="-1.55" layer="29"/>
<rectangle x1="-3.375" y1="-1.875" x2="-2.7" y2="-1.625" layer="31"/>
<rectangle x1="-3.4" y1="-2.45" x2="-2.7" y2="-2.05" layer="29"/>
<rectangle x1="-3.375" y1="-2.375" x2="-2.7" y2="-2.125" layer="31"/>
<rectangle x1="-2.6" y1="-3.25" x2="-1.9" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="-2.5875" y1="-3.1625" x2="-1.9125" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="-2.1" y1="-3.25" x2="-1.4" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="-2.0875" y1="-3.1625" x2="-1.4125" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="-1.6" y1="-3.25" x2="-0.9" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="-1.5875" y1="-3.1625" x2="-0.9125" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="-1.1" y1="-3.25" x2="-0.4" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="-1.0875" y1="-3.1625" x2="-0.4125" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="-0.6" y1="-3.25" x2="0.1" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="-0.5875" y1="-3.1625" x2="0.0875" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="-0.1" y1="-3.25" x2="0.6" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="-0.0875" y1="-3.1625" x2="0.5875" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="0.4" y1="-3.25" x2="1.1" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="0.4125" y1="-3.1625" x2="1.0875" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="0.9" y1="-3.25" x2="1.6" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="0.9125" y1="-3.1625" x2="1.5875" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="1.4" y1="-3.25" x2="2.1" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="1.4125" y1="-3.1625" x2="2.0875" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="1.9" y1="-3.25" x2="2.6" y2="-2.85" layer="29" rot="R90"/>
<rectangle x1="1.9125" y1="-3.1625" x2="2.5875" y2="-2.9125" layer="31" rot="R90"/>
<rectangle x1="2.7" y1="-2.45" x2="3.4" y2="-2.05" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="-2.375" x2="3.375" y2="-2.125" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="-1.95" x2="3.4" y2="-1.55" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="-1.875" x2="3.375" y2="-1.625" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="-1.45" x2="3.4" y2="-1.05" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="-1.375" x2="3.375" y2="-1.125" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="-0.95" x2="3.4" y2="-0.55" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="-0.875" x2="3.375" y2="-0.625" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="-0.45" x2="3.4" y2="-0.05" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="-0.375" x2="3.375" y2="-0.125" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="0.05" x2="3.4" y2="0.45" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="0.125" x2="3.375" y2="0.375" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="0.55" x2="3.4" y2="0.95" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="0.625" x2="3.375" y2="0.875" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="1.05" x2="3.4" y2="1.45" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="1.125" x2="3.375" y2="1.375" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="1.55" x2="3.4" y2="1.95" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="1.625" x2="3.375" y2="1.875" layer="31" rot="R180"/>
<rectangle x1="2.7" y1="2.05" x2="3.4" y2="2.45" layer="29" rot="R180"/>
<rectangle x1="2.7" y1="2.125" x2="3.375" y2="2.375" layer="31" rot="R180"/>
<rectangle x1="1.9" y1="2.85" x2="2.6" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="1.9125" y1="2.9125" x2="2.5875" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="1.4" y1="2.85" x2="2.1" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="1.4125" y1="2.9125" x2="2.0875" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="0.9" y1="2.85" x2="1.6" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="0.9125" y1="2.9125" x2="1.5875" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="0.4" y1="2.85" x2="1.1" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="0.4125" y1="2.9125" x2="1.0875" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-0.1" y1="2.85" x2="0.6" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="-0.0875" y1="2.9125" x2="0.5875" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-0.6" y1="2.85" x2="0.1" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="-0.5875" y1="2.9125" x2="0.0875" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-1.1" y1="2.85" x2="-0.4" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="-1.0875" y1="2.9125" x2="-0.4125" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-1.6" y1="2.85" x2="-0.9" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="-1.5875" y1="2.9125" x2="-0.9125" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-2.1" y1="2.85" x2="-1.4" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="-2.0875" y1="2.9125" x2="-1.4125" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-2.6" y1="2.85" x2="-1.9" y2="3.25" layer="29" rot="R270"/>
<rectangle x1="-2.5875" y1="2.9125" x2="-1.9125" y2="3.1625" layer="31" rot="R270"/>
<rectangle x1="-2.025" y1="0.875" x2="-0.875" y2="2.025" layer="29"/>
<rectangle x1="-0.575" y1="0.875" x2="0.575" y2="2.025" layer="29"/>
<rectangle x1="0.875" y1="0.875" x2="2.025" y2="2.025" layer="29"/>
<rectangle x1="-2.025" y1="-0.575" x2="-0.875" y2="0.575" layer="29"/>
<rectangle x1="-0.575" y1="-0.575" x2="0.575" y2="0.575" layer="29"/>
<rectangle x1="0.875" y1="-0.575" x2="2.025" y2="0.575" layer="29"/>
<rectangle x1="-2.025" y1="-2.025" x2="-0.875" y2="-0.875" layer="29"/>
<rectangle x1="-0.575" y1="-2.025" x2="0.575" y2="-0.875" layer="29"/>
<rectangle x1="0.875" y1="-2.025" x2="2.025" y2="-0.875" layer="29"/>
<rectangle x1="-1.975" y1="0.925" x2="-0.925" y2="1.975" layer="31"/>
<rectangle x1="-0.525" y1="0.925" x2="0.525" y2="1.975" layer="31"/>
<rectangle x1="0.925" y1="0.925" x2="1.975" y2="1.975" layer="31"/>
<rectangle x1="-1.975" y1="-0.525" x2="-0.925" y2="0.525" layer="31"/>
<rectangle x1="-0.525" y1="-0.525" x2="0.525" y2="0.525" layer="31"/>
<rectangle x1="0.925" y1="-0.525" x2="1.975" y2="0.525" layer="31"/>
<rectangle x1="-1.975" y1="-1.975" x2="-0.925" y2="-0.925" layer="31"/>
<rectangle x1="-0.525" y1="-1.975" x2="0.525" y2="-0.925" layer="31"/>
<rectangle x1="0.925" y1="-1.975" x2="1.975" y2="-0.925" layer="31"/>
<rectangle x1="-3" y1="2.5" x2="-2.5" y2="3" layer="21"/>
<rectangle x1="-3" y1="2.75" x2="-2.75" y2="3" layer="1"/>
</package>
<package name="SC70">
<smd name="1" x="-0.65" y="-1.1" dx="0.35" dy="0.85" layer="1"/>
<smd name="2" x="0" y="-1.1" dx="0.35" dy="0.85" layer="1"/>
<smd name="3" x="0.65" y="-1.1" dx="0.35" dy="0.85" layer="1"/>
<smd name="4" x="0.65" y="1.1" dx="0.35" dy="0.85" layer="1"/>
<smd name="5" x="-0.65" y="1.1" dx="0.35" dy="0.85" layer="1"/>
<text x="-2.205" y="1.605" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.305" y="-2.929" size="1.27" layer="27">&gt;VALUE</text>
<wire x1="1" y1="0.7" x2="0.7" y2="0.7" width="0.1" layer="21"/>
<wire x1="0.7" y1="0.7" x2="0.6" y2="0.7" width="0.1" layer="21"/>
<wire x1="-0.6" y1="0.7" x2="-0.7" y2="0.7" width="0.1" layer="21"/>
<wire x1="-0.7" y1="0.7" x2="-1" y2="0.7" width="0.1" layer="21"/>
<wire x1="-1" y1="0.7" x2="-1" y2="-0.7" width="0.1" layer="21"/>
<wire x1="-1" y1="-0.7" x2="-0.7" y2="-0.7" width="0.1" layer="21"/>
<wire x1="-0.7" y1="-0.7" x2="-0.6" y2="-0.7" width="0.1" layer="21"/>
<wire x1="-0.05" y1="-0.7" x2="0.05" y2="-0.7" width="0.1" layer="21"/>
<wire x1="0.6" y1="-0.7" x2="0.7" y2="-0.7" width="0.1" layer="21"/>
<wire x1="0.7" y1="-0.7" x2="1" y2="-0.7" width="0.1" layer="21"/>
<wire x1="1" y1="-0.7" x2="1" y2="0.7" width="0.1" layer="21"/>
<wire x1="-0.7" y1="0.7" x2="-0.7" y2="1.1" width="0.1" layer="21"/>
<wire x1="-0.7" y1="1.1" x2="-0.6" y2="1.1" width="0.1" layer="21"/>
<wire x1="-0.6" y1="1.1" x2="-0.6" y2="0.7" width="0.1" layer="21"/>
<wire x1="-0.6" y1="0.7" x2="0.6" y2="0.7" width="0.1" layer="21"/>
<wire x1="0.6" y1="0.7" x2="0.6" y2="1.1" width="0.1" layer="21"/>
<wire x1="0.6" y1="1.1" x2="0.7" y2="1.1" width="0.1" layer="21"/>
<wire x1="0.7" y1="1.1" x2="0.7" y2="0.7" width="0.1" layer="21"/>
<wire x1="-0.7" y1="-0.7" x2="-0.7" y2="-1.1" width="0.1" layer="21"/>
<wire x1="-0.7" y1="-1.1" x2="-0.6" y2="-1.1" width="0.1" layer="21"/>
<wire x1="-0.6" y1="-1.1" x2="-0.6" y2="-0.7" width="0.1" layer="21"/>
<wire x1="-0.6" y1="-0.7" x2="-0.05" y2="-0.7" width="0.1" layer="21"/>
<wire x1="-0.05" y1="-0.7" x2="-0.05" y2="-1.1" width="0.1" layer="21"/>
<wire x1="-0.05" y1="-1.1" x2="0.05" y2="-1.1" width="0.1" layer="21"/>
<wire x1="0.05" y1="-1.1" x2="0.05" y2="-0.7" width="0.1" layer="21"/>
<wire x1="0.05" y1="-0.7" x2="0.6" y2="-0.7" width="0.1" layer="21"/>
<wire x1="0.6" y1="-0.7" x2="0.6" y2="-1.1" width="0.1" layer="21"/>
<wire x1="0.6" y1="-1.1" x2="0.7" y2="-1.1" width="0.1" layer="21"/>
<wire x1="0.7" y1="-1.1" x2="0.7" y2="-0.7" width="0.1" layer="21"/>
<circle x="-0.7" y="-0.4" radius="0.1" width="0.1" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="CC2540">
<wire x1="-27.94" y1="-20.32" x2="30.48" y2="-20.32" width="0.254" layer="94"/>
<wire x1="30.48" y1="-20.32" x2="30.48" y2="17.78" width="0.254" layer="94"/>
<wire x1="30.48" y1="17.78" x2="-27.94" y2="17.78" width="0.254" layer="94"/>
<wire x1="-27.94" y1="17.78" x2="-27.94" y2="-20.32" width="0.254" layer="94"/>
<text x="-27.94" y="19.05" size="1.778" layer="95">&gt;NAME</text>
<text x="-27.94" y="-22.86" size="1.778" layer="96">&gt;VALUE</text>
<pin name="DGND_USB" x="-30.48" y="10.16" length="short" direction="pwr"/>
<pin name="USB_P" x="-30.48" y="7.62" length="short"/>
<pin name="USB_N" x="-30.48" y="5.08" length="short"/>
<pin name="DVDD_USB" x="-30.48" y="2.54" length="short" direction="pwr"/>
<pin name="P1_5" x="-30.48" y="0" length="short"/>
<pin name="P1_4" x="-30.48" y="-2.54" length="short"/>
<pin name="P1_3" x="-30.48" y="-5.08" length="short"/>
<pin name="P1_2" x="-30.48" y="-7.62" length="short"/>
<pin name="P1_1" x="-30.48" y="-10.16" length="short"/>
<pin name="DVDD2" x="-30.48" y="-12.7" length="short" direction="pwr"/>
<pin name="P1_0" x="-10.16" y="-22.86" length="short" rot="R90"/>
<pin name="P0_7" x="-7.62" y="-22.86" length="short" rot="R90"/>
<pin name="P0_6" x="-5.08" y="-22.86" length="short" rot="R90"/>
<pin name="P0_5" x="-2.54" y="-22.86" length="short" rot="R90"/>
<pin name="P0_4" x="0" y="-22.86" length="short" rot="R90"/>
<pin name="P0_3" x="2.54" y="-22.86" length="short" rot="R90"/>
<pin name="P0_2" x="5.08" y="-22.86" length="short" rot="R90"/>
<pin name="P0_1" x="7.62" y="-22.86" length="short" rot="R90"/>
<pin name="P0_0" x="10.16" y="-22.86" length="short" rot="R90"/>
<pin name="RESET_N" x="12.7" y="-22.86" length="short" direction="in" rot="R90"/>
<pin name="AVDD5" x="33.02" y="-12.7" length="short" direction="pwr" rot="R180"/>
<pin name="XOSC_Q1" x="33.02" y="-10.16" length="short" rot="R180"/>
<pin name="XOSC_Q2" x="33.02" y="-7.62" length="short" rot="R180"/>
<pin name="AVDD3" x="33.02" y="-5.08" length="short" direction="pwr" rot="R180"/>
<pin name="RF_P" x="33.02" y="-2.54" length="short" direction="in" rot="R180"/>
<pin name="RF_N" x="33.02" y="0" length="short" direction="in" rot="R180"/>
<pin name="AVDD2" x="33.02" y="2.54" length="short" direction="pwr" rot="R180"/>
<pin name="AVDD1" x="33.02" y="5.08" length="short" direction="pwr" rot="R180"/>
<pin name="AVDD4" x="33.02" y="7.62" length="short" direction="pwr" rot="R180"/>
<pin name="RBIAS" x="33.02" y="10.16" length="short" rot="R180"/>
<pin name="AVDD6" x="12.7" y="20.32" length="short" direction="pwr" rot="R270"/>
<pin name="P2_4/XOSC32K_Q1" x="10.16" y="20.32" length="short" rot="R270"/>
<pin name="P2_3/XOSC32K_Q2" x="7.62" y="20.32" length="short" rot="R270"/>
<pin name="P2_2" x="5.08" y="20.32" length="short" rot="R270"/>
<pin name="P2_1" x="2.54" y="20.32" length="short" rot="R270"/>
<pin name="P2_0" x="0" y="20.32" length="short" rot="R270"/>
<pin name="P1_7" x="-2.54" y="20.32" length="short" rot="R270"/>
<pin name="P1_6" x="-5.08" y="20.32" length="short" rot="R270"/>
<pin name="DVDD1" x="-7.62" y="20.32" length="short" direction="pwr" rot="R270"/>
<pin name="DCOUPL" x="-10.16" y="20.32" length="short" direction="pwr" rot="R270"/>
</symbol>
<symbol name="EXP-16">
<wire x1="-19.05" y1="2.54" x2="21.59" y2="2.54" width="0.254" layer="94"/>
<wire x1="21.59" y1="2.54" x2="21.59" y2="-1.27" width="0.254" layer="94"/>
<wire x1="21.59" y1="-1.27" x2="-19.05" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-19.05" y1="-1.27" x2="-19.05" y2="2.54" width="0.254" layer="94"/>
<text x="-3.81" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="EXP16@1" x="-17.78" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@2" x="-15.24" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@3" x="-12.7" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@4" x="-10.16" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@5" x="-7.62" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@6" x="-5.08" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@7" x="-2.54" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@8" x="0" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@9" x="2.54" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@10" x="5.08" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@11" x="7.62" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@12" x="10.16" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@13" x="12.7" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@14" x="15.24" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@15" x="17.78" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
<pin name="EXP16@16" x="20.32" y="5.08" visible="off" length="short" direction="in" rot="R270"/>
</symbol>
<symbol name="TPS71530">
<wire x1="-7.62" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.62" y="8.89" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="NC1" x="12.7" y="0" length="short" direction="in" rot="R180"/>
<pin name="GND" x="-10.16" y="-5.08" length="short" direction="in"/>
<pin name="IN" x="-10.16" y="5.08" length="short" direction="pas"/>
<pin name="OUT" x="12.7" y="5.08" length="short" direction="pas" rot="R180"/>
<pin name="NC2" x="12.7" y="-5.08" length="short" direction="pwr" rot="R180"/>
<text x="-7.62" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="CC2540" prefix="IC">
<description>&lt;b&gt;2.4-GHz Bluetooth® low energy System-on-Chip&lt;/b&gt;&lt;p&gt;
Auto generated by &lt;i&gt;make-symbol-device-package-bsdl.ulp Rev. 39&lt;/i&gt;&lt;br&gt;
Source: cc2540.txt</description>
<gates>
<gate name="G$1" symbol="CC2540" x="0" y="0"/>
<gate name="EXP" symbol="EXP-16" x="68.58" y="-12.7" addlevel="always"/>
</gates>
<devices>
<device name="" package="QFN40-6X6">
<connects>
<connect gate="EXP" pin="EXP16@1" pad="EXP@1"/>
<connect gate="EXP" pin="EXP16@10" pad="EXP@10"/>
<connect gate="EXP" pin="EXP16@11" pad="EXP@11"/>
<connect gate="EXP" pin="EXP16@12" pad="EXP@12"/>
<connect gate="EXP" pin="EXP16@13" pad="EXP@13"/>
<connect gate="EXP" pin="EXP16@14" pad="EXP@14"/>
<connect gate="EXP" pin="EXP16@15" pad="EXP@15"/>
<connect gate="EXP" pin="EXP16@16" pad="EXP@16"/>
<connect gate="EXP" pin="EXP16@2" pad="EXP@2"/>
<connect gate="EXP" pin="EXP16@3" pad="EXP@3"/>
<connect gate="EXP" pin="EXP16@4" pad="EXP@4"/>
<connect gate="EXP" pin="EXP16@5" pad="EXP@5"/>
<connect gate="EXP" pin="EXP16@6" pad="EXP@6"/>
<connect gate="EXP" pin="EXP16@7" pad="EXP@7"/>
<connect gate="EXP" pin="EXP16@8" pad="EXP@8"/>
<connect gate="EXP" pin="EXP16@9" pad="EXP@9"/>
<connect gate="G$1" pin="AVDD1" pad="28"/>
<connect gate="G$1" pin="AVDD2" pad="27"/>
<connect gate="G$1" pin="AVDD3" pad="24"/>
<connect gate="G$1" pin="AVDD4" pad="29"/>
<connect gate="G$1" pin="AVDD5" pad="21"/>
<connect gate="G$1" pin="AVDD6" pad="31"/>
<connect gate="G$1" pin="DCOUPL" pad="40"/>
<connect gate="G$1" pin="DGND_USB" pad="1"/>
<connect gate="G$1" pin="DVDD1" pad="39"/>
<connect gate="G$1" pin="DVDD2" pad="10"/>
<connect gate="G$1" pin="DVDD_USB" pad="4"/>
<connect gate="G$1" pin="P0_0" pad="19"/>
<connect gate="G$1" pin="P0_1" pad="18"/>
<connect gate="G$1" pin="P0_2" pad="17"/>
<connect gate="G$1" pin="P0_3" pad="16"/>
<connect gate="G$1" pin="P0_4" pad="15"/>
<connect gate="G$1" pin="P0_5" pad="14"/>
<connect gate="G$1" pin="P0_6" pad="13"/>
<connect gate="G$1" pin="P0_7" pad="12"/>
<connect gate="G$1" pin="P1_0" pad="11"/>
<connect gate="G$1" pin="P1_1" pad="9"/>
<connect gate="G$1" pin="P1_2" pad="8"/>
<connect gate="G$1" pin="P1_3" pad="7"/>
<connect gate="G$1" pin="P1_4" pad="6"/>
<connect gate="G$1" pin="P1_5" pad="5"/>
<connect gate="G$1" pin="P1_6" pad="38"/>
<connect gate="G$1" pin="P1_7" pad="37"/>
<connect gate="G$1" pin="P2_0" pad="36"/>
<connect gate="G$1" pin="P2_1" pad="35"/>
<connect gate="G$1" pin="P2_2" pad="34"/>
<connect gate="G$1" pin="P2_3/XOSC32K_Q2" pad="33"/>
<connect gate="G$1" pin="P2_4/XOSC32K_Q1" pad="32"/>
<connect gate="G$1" pin="RBIAS" pad="30"/>
<connect gate="G$1" pin="RESET_N" pad="20"/>
<connect gate="G$1" pin="RF_N" pad="26"/>
<connect gate="G$1" pin="RF_P" pad="25"/>
<connect gate="G$1" pin="USB_N" pad="3"/>
<connect gate="G$1" pin="USB_P" pad="2"/>
<connect gate="G$1" pin="XOSC_Q1" pad="22"/>
<connect gate="G$1" pin="XOSC_Q2" pad="23"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TPS71530" prefix="U">
<gates>
<gate name="G$1" symbol="TPS71530" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="4"/>
<connect gate="G$1" pin="NC1" pad="1"/>
<connect gate="G$1" pin="NC2" pad="3"/>
<connect gate="G$1" pin="OUT" pad="5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="smd-ipc">
<description>&lt;b&gt;IPC Standard SMD Packages&lt;/b&gt;&lt;p&gt;
This is a package-only library, based on the Surface Mount Design and Land Pattern Standard developed by the 
Institute for Interconnecting and Packaging electronic Circuits (IPC).&lt;p&gt;
Source:&lt;p&gt;
IPC-SM-782&lt;br&gt;
Revision A, August 1993&lt;br&gt;
Includes Amendment 1, October 1996&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="C0402">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<smd name="1" x="-0.48" y="0" dx="0.59" dy="0.64" layer="1" roundness="30"/>
<smd name="2" x="0.48" y="0" dx="0.59" dy="0.64" layer="1" roundness="30"/>
<text x="-1.005" y="0.365" size="0.4" layer="25">&gt;NAME</text>
<text x="-1.005" y="-0.765" size="0.4" layer="27">&gt;VALUE</text>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="0.5" y1="0.2" x2="0.5" y2="-0.2" width="0.1" layer="21"/>
<wire x1="0.5" y1="-0.2" x2="0.4" y2="-0.2" width="0.1" layer="21"/>
<wire x1="0.3" y1="-0.2" x2="-0.3" y2="-0.2" width="0.1" layer="21"/>
<wire x1="-0.4" y1="-0.2" x2="-0.5" y2="-0.2" width="0.1" layer="21"/>
<wire x1="-0.5" y1="-0.2" x2="-0.5" y2="0.2" width="0.1" layer="21"/>
<wire x1="-0.5" y1="0.2" x2="-0.4" y2="0.2" width="0.1" layer="21"/>
<wire x1="0.4" y1="0.2" x2="0.5" y2="0.2" width="0.1" layer="21"/>
<wire x1="-0.3" y1="0.2" x2="-0.4" y2="0.2" width="0.1" layer="21"/>
<wire x1="-0.4" y1="0.2" x2="-0.4" y2="-0.2" width="0.1" layer="21"/>
<wire x1="-0.4" y1="-0.2" x2="-0.3" y2="-0.2" width="0.1" layer="21"/>
<wire x1="-0.3" y1="-0.2" x2="-0.3" y2="0.2" width="0.1" layer="21"/>
<wire x1="-0.3" y1="0.2" x2="0.3" y2="0.2" width="0.1" layer="21"/>
<wire x1="0.3" y1="0.2" x2="0.4" y2="0.2" width="0.1" layer="21"/>
<wire x1="0.4" y1="0.2" x2="0.4" y2="-0.2" width="0.1" layer="21"/>
<wire x1="0.4" y1="-0.2" x2="0.3" y2="-0.2" width="0.1" layer="21"/>
<wire x1="0.3" y1="-0.2" x2="0.3" y2="0.2" width="0.1" layer="21"/>
<wire x1="-0.9" y1="0.43" x2="-0.9" y2="-0.43" width="0.02" layer="39"/>
<wire x1="-0.9" y1="-0.43" x2="0.9" y2="-0.43" width="0.02" layer="39"/>
<wire x1="0.9" y1="-0.43" x2="0.9" y2="0.43" width="0.02" layer="39"/>
<wire x1="0.9" y1="0.43" x2="-0.9" y2="0.43" width="0.02" layer="39"/>
</package>
<package name="C0603">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.373" y1="0.583" x2="1.373" y2="0.583" width="0.02" layer="39"/>
<wire x1="1.373" y1="0.583" x2="1.373" y2="-0.583" width="0.02" layer="39"/>
<wire x1="1.373" y1="-0.583" x2="-1.373" y2="-0.583" width="0.02" layer="39"/>
<wire x1="-1.373" y1="-0.583" x2="-1.373" y2="0.583" width="0.02" layer="39"/>
<smd name="1" x="-0.75" y="0" dx="0.9" dy="0.95" layer="1" roundness="30"/>
<smd name="2" x="0.75" y="0" dx="0.9" dy="0.95" layer="1" roundness="30"/>
<text x="-0.835" y="0.535" size="0.4" layer="25">&gt;NAME</text>
<text x="-0.835" y="-0.905" size="0.4" layer="27">&gt;VALUE</text>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="-0.8" y1="0.4" x2="-0.8" y2="-0.4" width="0.04" layer="21"/>
<wire x1="-0.8" y1="-0.4" x2="0.8" y2="-0.4" width="0.04" layer="21"/>
<wire x1="0.8" y1="-0.4" x2="0.8" y2="0.4" width="0.04" layer="21"/>
<wire x1="0.8" y1="0.4" x2="-0.8" y2="0.4" width="0.04" layer="21"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.5" y2="0.4" layer="21"/>
<rectangle x1="0.5" y1="-0.4" x2="0.8" y2="0.4" layer="21"/>
<rectangle x1="-0.5" y1="-0.4" x2="-0.4" y2="0.4" layer="21"/>
<rectangle x1="0.4" y1="-0.4" x2="0.5" y2="0.4" layer="21"/>
<rectangle x1="-0.5" y1="-0.4" x2="0.5" y2="-0.3" layer="21"/>
<rectangle x1="-0.4" y1="0.3" x2="0.5" y2="0.4" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="C_EU">
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-4.699" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="L_US">
<wire x1="0" y1="5.08" x2="1.27" y2="3.81" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="2.54" x2="1.27" y2="3.81" width="0.254" layer="94" curve="90" cap="flat"/>
<wire x1="0" y1="2.54" x2="1.27" y2="1.27" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="90" cap="flat"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-1.27" width="0.254" layer="94" curve="90" cap="flat"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-3.81" width="0.254" layer="94" curve="-90" cap="flat"/>
<wire x1="0" y1="-5.08" x2="1.27" y2="-3.81" width="0.254" layer="94" curve="90" cap="flat"/>
<text x="-1.27" y="-5.08" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="3.81" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="2" x="0" y="-7.62" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
<pin name="1" x="0" y="7.62" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
</symbol>
<symbol name="R_EU">
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C0402" prefix="C">
<gates>
<gate name="G$1" symbol="C_EU" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="L0402" prefix="L">
<gates>
<gate name="G$1" symbol="L_US" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R0402" prefix="R">
<gates>
<gate name="G$1" symbol="R_EU" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R0603" prefix="R">
<gates>
<gate name="G$1" symbol="R_EU" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C0603" prefix="C">
<gates>
<gate name="G$1" symbol="C_EU" x="0" y="0"/>
</gates>
<devices>
<device name="" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VDD">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VDD" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VDD" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VDD" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="crystal">
<description>&lt;b&gt;Crystals and Crystal Resonators&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="FA-128">
<description>&lt;b&gt;&lt;b&gt;MHZ RANGE CRYSTASL UNIT&lt;/b&gt;&lt;/b&gt; FA-128&lt;p&gt;
ULTRA MINIATURE SIZE LOW PROFILE SMD&lt;br&gt;
Source: Epson Toyocom FA128.pdf</description>
<wire x1="-0.9" y1="0.7" x2="0.9" y2="0.7" width="0.2032" layer="51"/>
<wire x1="0.9" y1="0.7" x2="0.9" y2="-0.7" width="0.2032" layer="51"/>
<wire x1="0.9" y1="-0.7" x2="-0.9" y2="-0.7" width="0.2032" layer="51"/>
<wire x1="-0.9" y1="-0.7" x2="-0.9" y2="0.7" width="0.2032" layer="51"/>
<smd name="1" x="-0.725" y="-0.575" dx="0.95" dy="0.85" layer="1" stop="no" cream="no"/>
<smd name="2" x="0.725" y="-0.575" dx="0.95" dy="0.85" layer="1" stop="no" cream="no"/>
<smd name="3" x="0.725" y="0.575" dx="0.95" dy="0.85" layer="1" rot="R180" stop="no" cream="no"/>
<smd name="4" x="-0.725" y="0.575" dx="0.95" dy="0.85" layer="1" rot="R180" stop="no" cream="no"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.25" y1="0.1" x2="-0.2" y2="1.05" layer="29"/>
<rectangle x1="0.2" y1="0.1" x2="1.25" y2="1.05" layer="29"/>
<rectangle x1="-1.25" y1="-1.05" x2="-0.2" y2="-0.1" layer="29"/>
<rectangle x1="-1.15" y1="0.2" x2="-0.3" y2="0.95" layer="31"/>
<rectangle x1="0.3" y1="0.2" x2="1.15" y2="0.95" layer="31"/>
<rectangle x1="-1.15" y1="-0.95" x2="-0.3" y2="-0.2" layer="31"/>
<polygon width="0.0508" layer="31">
<vertex x="0.325" y="-0.475"/>
<vertex x="0.575" y="-0.225"/>
<vertex x="1.125" y="-0.225"/>
<vertex x="1.125" y="-0.925"/>
<vertex x="0.325" y="-0.925"/>
</polygon>
<polygon width="0.0508" layer="29">
<vertex x="0.225" y="-1.025"/>
<vertex x="0.225" y="-0.45"/>
<vertex x="0.55" y="-0.125"/>
<vertex x="1.225" y="-0.125"/>
<vertex x="1.225" y="-1.025"/>
</polygon>
</package>
<package name="FA-20H">
<description>&lt;b&gt;MHZ RANGE CRYSTASL UNIT&lt;/b&gt; FA-20H&lt;p&gt;
ULTRA MINIATURE SIZE LOW PROFILE SMD&lt;br&gt;
Source: Epson Toyocom FA-20H.pdf</description>
<wire x1="-1.15" y1="0.9" x2="1.15" y2="0.9" width="0.2032" layer="51"/>
<wire x1="1.15" y1="0.9" x2="1.15" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="1.15" y1="-0.9" x2="-1.15" y2="-0.9" width="0.2032" layer="51"/>
<wire x1="-1.15" y1="-0.9" x2="-1.15" y2="0.9" width="0.2032" layer="51"/>
<smd name="1" x="-0.85" y="-0.7" dx="1.2" dy="1.1" layer="1" stop="no" cream="no"/>
<smd name="2" x="0.85" y="-0.7" dx="1.2" dy="1.1" layer="1" stop="no" cream="no"/>
<smd name="3" x="0.85" y="0.7" dx="1.2" dy="1.1" layer="1" rot="R180" stop="no" cream="no"/>
<smd name="4" x="-0.85" y="0.7" dx="1.2" dy="1.1" layer="1" rot="R180" stop="no" cream="no"/>
<text x="-1.445" y="1.47" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.45" y="-2.75" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.5" y1="0.1" x2="-0.2" y2="1.3" layer="29"/>
<rectangle x1="0.2" y1="0.1" x2="1.5" y2="1.3" layer="29"/>
<rectangle x1="-1.5" y1="-1.3" x2="-0.2" y2="-0.1" layer="29"/>
<rectangle x1="-1.4" y1="0.2" x2="-0.3" y2="1.2" layer="31"/>
<rectangle x1="0.3" y1="0.2" x2="1.4" y2="1.2" layer="31"/>
<rectangle x1="-1.4" y1="-1.2" x2="-0.3" y2="-0.2" layer="31"/>
<polygon width="0.0508" layer="31">
<vertex x="0.325" y="-0.475"/>
<vertex x="0.575" y="-0.225"/>
<vertex x="1.375" y="-0.225"/>
<vertex x="1.375" y="-1.175"/>
<vertex x="0.325" y="-1.175"/>
</polygon>
<polygon width="0.0508" layer="29">
<vertex x="0.225" y="-1.275"/>
<vertex x="0.225" y="-0.45"/>
<vertex x="0.55" y="-0.125"/>
<vertex x="1.475" y="-0.125"/>
<vertex x="1.475" y="-1.275"/>
</polygon>
</package>
<package name="MC-306">
<description>&lt;b&gt;MC-306 CRYSTAL UNIT&lt;/b&gt;&lt;p&gt;
Source: MC-306_405_406_E07X.PDF</description>
<wire x1="-3.9" y1="1.5" x2="3.9" y2="1.5" width="0.2032" layer="51"/>
<wire x1="3.9" y1="1.5" x2="3.9" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="3.9" y1="-1.5" x2="-3.9" y2="-1.5" width="0.2032" layer="51"/>
<wire x1="-3.9" y1="-1.5" x2="-3.9" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="1.5" x2="1.4" y2="1.5" width="0.2032" layer="21"/>
<wire x1="1.4" y1="-1.5" x2="-1.4" y2="-1.5" width="0.2032" layer="21"/>
<wire x1="-3.8" y1="0.5" x2="-3.8" y2="-0.5" width="0.2032" layer="21" curve="-180"/>
<smd name="1" x="-2.75" y="-1.6" dx="1.3" dy="1.9" layer="1"/>
<smd name="2" x="2.75" y="-1.6" dx="1.3" dy="1.9" layer="1"/>
<smd name="3" x="2.75" y="1.6" dx="1.3" dy="1.9" layer="1" rot="R180"/>
<smd name="4" x="-2.75" y="1.6" dx="1.3" dy="1.9" layer="1" rot="R180"/>
<text x="-4.0192" y="2.815" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.0192" y="-4.593" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="Q-SHIELD2">
<wire x1="2.286" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0.254" y2="0" width="0.1524" layer="94"/>
<wire x1="0.889" y1="1.524" x2="0.889" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0.889" y1="-1.524" x2="1.651" y2="-1.524" width="0.254" layer="94"/>
<wire x1="1.651" y1="-1.524" x2="1.651" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.651" y1="1.524" x2="0.889" y2="1.524" width="0.254" layer="94"/>
<wire x1="2.286" y1="1.778" x2="2.286" y2="0" width="0.254" layer="94"/>
<wire x1="2.286" y1="0" x2="2.286" y2="-1.778" width="0.254" layer="94"/>
<wire x1="0.254" y1="1.778" x2="0.254" y2="0" width="0.254" layer="94"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.778" y1="1.905" x2="-1.778" y2="2.54" width="0.1524" layer="94" style="shortdash"/>
<wire x1="-1.778" y1="2.54" x2="4.318" y2="2.54" width="0.1524" layer="94" style="shortdash"/>
<wire x1="4.318" y1="2.54" x2="4.318" y2="1.905" width="0.1524" layer="94" style="shortdash"/>
<wire x1="4.318" y1="-1.905" x2="4.318" y2="-2.54" width="0.1524" layer="94" style="shortdash"/>
<wire x1="-1.778" y1="-2.54" x2="4.318" y2="-2.54" width="0.1524" layer="94" style="shortdash"/>
<wire x1="-1.778" y1="-2.54" x2="-1.778" y2="-1.905" width="0.1524" layer="94" style="shortdash"/>
<text x="-2.54" y="6.096" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="3.81" size="1.778" layer="96">&gt;VALUE</text>
<pin name="3" x="5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="4" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="2" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="Q">
<wire x1="1.016" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.016" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.016" y1="1.778" x2="1.016" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="-1.778" width="0.254" layer="94"/>
<text x="2.54" y="1.016" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.159" y="-1.143" size="0.8636" layer="93">1</text>
<text x="1.524" y="-1.143" size="0.8636" layer="93">2</text>
<pin name="2" x="2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="point" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FA-" prefix="Q">
<description>&lt;b&gt;MHz RANGE CRYSTAL UNIT&lt;/b&gt; &lt;p&gt;
Source: Epson Toyocom</description>
<gates>
<gate name="G$1" symbol="Q-SHIELD2" x="0" y="0"/>
</gates>
<devices>
<device name="128" package="FA-128">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="20H" package="FA-20H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MC-306" prefix="Q">
<description>&lt;b&gt;kHz RANGE CRYSTAL UNIT&lt;/b&gt; SMD&lt;p&gt;
Source: MC-306_405_406_E07X.PDF &lt;a href="http://www.epsontoyocom.co.jp"&gt; Homepage &lt;/a&gt;</description>
<gates>
<gate name="P" symbol="Q" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MC-306">
<connects>
<connect gate="P" pin="1" pad="1"/>
<connect gate="P" pin="2" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="MC-306 60.0KHZ  100PPM ,12.5PF" constant="no"/>
<attribute name="OC_FARNELL" value="1278040" constant="no"/>
<attribute name="OC_NEWARK" value="31M5576" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2X05">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="1.905" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-5.08" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.334" y1="-1.524" x2="-4.826" y2="-1.016" layer="51"/>
<rectangle x1="-5.334" y1="1.016" x2="-4.826" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
<rectangle x1="4.826" y1="1.016" x2="5.334" y2="1.524" layer="51"/>
<rectangle x1="4.826" y1="-1.524" x2="5.334" y2="-1.016" layer="51"/>
</package>
<package name="2X05/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-5.08" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-5.461" x2="-4.699" y2="-4.699" layer="21"/>
<rectangle x1="-5.461" y1="-4.699" x2="-4.699" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-5.461" x2="-2.159" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-5.461" x2="0.381" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-5.461" x2="2.921" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-5.461" x2="5.461" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-4.699" x2="5.461" y2="-2.921" layer="51"/>
</package>
<package name="2X05_1.27_SMD">
<wire x1="-0.635" y1="-0.9525" x2="-0.3175" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.3175" y1="-1.27" x2="0.635" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-0.635" y1="0.9525" x2="-0.3175" y2="1.27" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="1.27" x2="0.3175" y2="1.27" width="0.127" layer="21"/>
<wire x1="0.3175" y1="1.27" x2="0.635" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-0.3175" y1="-1.27" x2="0.3175" y2="-1.27" width="0.127" layer="21"/>
<text x="-3.175" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.127" y1="0.508" x2="0.127" y2="0.762" layer="51"/>
<rectangle x1="-0.127" y1="-0.762" x2="0.127" y2="-0.508" layer="51"/>
<wire x1="-1.905" y1="-0.9525" x2="-1.5875" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-0.9525" y1="-1.27" x2="-0.635" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0.9525" x2="-1.5875" y2="1.27" width="0.127" layer="21"/>
<wire x1="-1.5875" y1="1.27" x2="-0.9525" y2="1.27" width="0.127" layer="21"/>
<wire x1="-0.9525" y1="1.27" x2="-0.635" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-0.635" y1="0.9525" x2="-0.635" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-1.5875" y1="-1.27" x2="-0.9525" y2="-1.27" width="0.127" layer="21"/>
<rectangle x1="-1.397" y1="0.508" x2="-1.143" y2="0.762" layer="51"/>
<rectangle x1="-1.397" y1="-0.762" x2="-1.143" y2="-0.508" layer="51"/>
<wire x1="-3.175" y1="-0.9525" x2="-2.8575" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-2.2225" y1="-1.27" x2="-1.905" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-3.175" y1="0.9525" x2="-2.8575" y2="1.27" width="0.127" layer="21"/>
<wire x1="-2.8575" y1="1.27" x2="-2.2225" y2="1.27" width="0.127" layer="21"/>
<wire x1="-2.2225" y1="1.27" x2="-1.905" y2="0.9525" width="0.127" layer="21"/>
<wire x1="-3.175" y1="0.9525" x2="-3.175" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-1.905" y1="0.9525" x2="-1.905" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="-2.8575" y1="-1.27" x2="-2.2225" y2="-1.27" width="0.127" layer="21"/>
<rectangle x1="-2.667" y1="0.508" x2="-2.413" y2="0.762" layer="51"/>
<rectangle x1="-2.667" y1="-0.762" x2="-2.413" y2="-0.508" layer="51"/>
<wire x1="0.635" y1="-0.9525" x2="0.9525" y2="-1.27" width="0.127" layer="21"/>
<wire x1="1.5875" y1="-1.27" x2="1.905" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="0.635" y1="0.9525" x2="0.9525" y2="1.27" width="0.127" layer="21"/>
<wire x1="0.9525" y1="1.27" x2="1.5875" y2="1.27" width="0.127" layer="21"/>
<wire x1="1.5875" y1="1.27" x2="1.905" y2="0.9525" width="0.127" layer="21"/>
<wire x1="0.635" y1="0.9525" x2="0.635" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="0.9525" y1="-1.27" x2="1.5875" y2="-1.27" width="0.127" layer="21"/>
<rectangle x1="1.143" y1="0.508" x2="1.397" y2="0.762" layer="51"/>
<rectangle x1="1.143" y1="-0.762" x2="1.397" y2="-0.508" layer="51"/>
<wire x1="1.905" y1="-0.9525" x2="2.2225" y2="-1.27" width="0.127" layer="21"/>
<wire x1="2.8575" y1="-1.27" x2="3.175" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="1.905" y1="0.9525" x2="2.2225" y2="1.27" width="0.127" layer="21"/>
<wire x1="2.2225" y1="1.27" x2="2.8575" y2="1.27" width="0.127" layer="21"/>
<wire x1="2.8575" y1="1.27" x2="3.175" y2="0.9525" width="0.127" layer="21"/>
<wire x1="1.905" y1="0.9525" x2="1.905" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="3.175" y1="0.9525" x2="3.175" y2="-0.9525" width="0.127" layer="21"/>
<wire x1="2.2225" y1="-1.27" x2="2.8575" y2="-1.27" width="0.127" layer="21"/>
<rectangle x1="2.413" y1="0.508" x2="2.667" y2="0.762" layer="51"/>
<rectangle x1="2.413" y1="-0.762" x2="2.667" y2="-0.508" layer="51"/>
<smd name="6" x="0" y="2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="5" x="0" y="-2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="4" x="-1.27" y="2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="2" x="-2.54" y="2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="3" x="-1.27" y="-2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="1" x="-2.54" y="-2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="7" x="1.27" y="-2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="9" x="2.54" y="-2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="8" x="1.27" y="2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
<smd name="10" x="2.54" y="2.05" dx="2.4" dy="0.76" layer="1" rot="R90"/>
</package>
<package name="1X04">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
<package name="1X02">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
<package name="1X09">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-3.81" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-8.89" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-11.43" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-0.635" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.795" y2="1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0.635" x2="11.43" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-0.635" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-1.27" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="7.62" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-11.5062" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-11.43" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<rectangle x1="-2.794" y1="-0.254" x2="-2.286" y2="0.254" layer="51"/>
<rectangle x1="-5.334" y1="-0.254" x2="-4.826" y2="0.254" layer="51"/>
<rectangle x1="-7.874" y1="-0.254" x2="-7.366" y2="0.254" layer="51"/>
<rectangle x1="-10.414" y1="-0.254" x2="-9.906" y2="0.254" layer="51"/>
<rectangle x1="9.906" y1="-0.254" x2="10.414" y2="0.254" layer="51"/>
</package>
<package name="1X09/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-11.43" y1="-1.905" x2="-8.89" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-1.905" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="0.635" x2="-11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="0.635" x2="-11.43" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="6.985" x2="-10.16" y2="1.27" width="0.762" layer="21"/>
<wire x1="-8.89" y1="-1.905" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="6.985" x2="-7.62" y2="1.27" width="0.762" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="8.89" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-1.905" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0.635" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="6.985" x2="7.62" y2="1.27" width="0.762" layer="21"/>
<wire x1="8.89" y1="-1.905" x2="11.43" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-1.905" x2="11.43" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0.635" x2="8.89" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="6.985" x2="10.16" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-10.16" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-7.62" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="0" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="2.54" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="5.08" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="7.62" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="10.16" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-12.065" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="13.335" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-10.541" y1="0.635" x2="-9.779" y2="1.143" layer="21"/>
<rectangle x1="-8.001" y1="0.635" x2="-7.239" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="7.239" y1="0.635" x2="8.001" y2="1.143" layer="21"/>
<rectangle x1="9.779" y1="0.635" x2="10.541" y2="1.143" layer="21"/>
<rectangle x1="-10.541" y1="-2.921" x2="-9.779" y2="-1.905" layer="21"/>
<rectangle x1="-8.001" y1="-2.921" x2="-7.239" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="7.239" y1="-2.921" x2="8.001" y2="-1.905" layer="21"/>
<rectangle x1="9.779" y1="-2.921" x2="10.541" y2="-1.905" layer="21"/>
</package>
<package name="1X08">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-10.2362" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.16" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
</package>
<package name="1X08/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-10.795" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="12.065" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINH2X5">
<wire x1="-6.35" y1="-7.62" x2="8.89" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-7.62" x2="8.89" y2="7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PINHD4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD2">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD9">
<wire x1="-6.35" y1="-12.7" x2="1.27" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-12.7" x2="1.27" y2="12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="12.7" x2="-6.35" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="12.7" x2="-6.35" y2="-12.7" width="0.4064" layer="94"/>
<text x="-6.35" y="13.335" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="9" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD8">
<wire x1="-6.35" y1="-10.16" x2="1.27" y2="-10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="1.27" y2="12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="12.7" x2="-6.35" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="12.7" x2="-6.35" y2="-10.16" width="0.4064" layer="94"/>
<text x="-6.35" y="13.335" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X5" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X5" x="0" y="0"/>
</gates>
<devices>
<device name="2.54_TH" package="2X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="2X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1.27_SMD" package="2X05_1.27_SMD">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X4" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X2" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X9" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD9" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X09">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X09/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X8" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X08">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X08/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="national-semiconductor">
<description>&lt;b&gt;National Semiconductor&lt;/b&gt;&lt;p&gt;
http://www.national.com&lt;br&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="LLP10">
<smd name="1" x="-1" y="-1.4" dx="0.25" dy="0.6" layer="1"/>
<smd name="2" x="-0.5" y="-1.4" dx="0.25" dy="0.6" layer="1"/>
<smd name="3" x="0" y="-1.4" dx="0.6" dy="0.25" layer="1" rot="R90"/>
<smd name="4" x="0.5" y="-1.4" dx="0.6" dy="0.25" layer="1" rot="R90"/>
<smd name="5" x="1" y="-1.4" dx="0.6" dy="0.25" layer="1" rot="R270"/>
<smd name="6" x="1" y="1.4" dx="0.6" dy="0.25" layer="1" rot="R270"/>
<smd name="7" x="0.5" y="1.4" dx="0.6" dy="0.25" layer="1" rot="R270"/>
<smd name="8" x="0" y="1.4" dx="0.6" dy="0.25" layer="1" rot="R270"/>
<smd name="EXP" x="0" y="0" dx="2" dy="1.6" layer="1"/>
<text x="-2.286" y="-2.032" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.556" y="-2.032" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<smd name="9" x="-0.5" y="1.4" dx="0.6" dy="0.25" layer="1" rot="R270"/>
<smd name="10" x="-1" y="1.4" dx="0.6" dy="0.25" layer="1" rot="R270"/>
<wire x1="1.5" y1="-1.5" x2="1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="1.5" x2="-1.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="1.5" x2="-1.5" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.5" x2="1.5" y2="-1.5" width="0.127" layer="21"/>
<circle x="-1.1" y="-1.1" radius="0.14141875" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="LM3658">
<wire x1="-10.16" y1="12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="12.7" x2="10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="10.16" y1="-15.24" x2="-10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-15.24" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<text x="-10.16" y="13.97" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="USB_PWR" x="-12.7" y="5.08" length="short" direction="pwr"/>
<pin name="USB_SEL" x="-12.7" y="0" length="short"/>
<pin name="EN_B" x="-12.7" y="-5.08" length="short"/>
<pin name="CHG_IN" x="-12.7" y="10.16" length="short" direction="pwr"/>
<pin name="GND" x="-12.7" y="-10.16" length="short" direction="pwr"/>
<pin name="BATT" x="12.7" y="10.16" length="short" direction="pwr" rot="R180"/>
<pin name="TS" x="12.7" y="5.08" length="short" rot="R180"/>
<pin name="STAT2" x="12.7" y="-10.16" length="short" rot="R180"/>
<pin name="STAT1" x="12.7" y="-5.08" length="short" rot="R180"/>
<pin name="ISET" x="12.7" y="0" length="short" rot="R180"/>
<pin name="GND_PAD" x="-12.7" y="-12.7" length="short" direction="pwr"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LM3658" prefix="U">
<gates>
<gate name="G$1" symbol="LM3658" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LLP10">
<connects>
<connect gate="G$1" pin="BATT" pad="10"/>
<connect gate="G$1" pin="CHG_IN" pad="1"/>
<connect gate="G$1" pin="EN_B" pad="5"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GND_PAD" pad="EXP"/>
<connect gate="G$1" pin="ISET" pad="8"/>
<connect gate="G$1" pin="STAT1" pad="7"/>
<connect gate="G$1" pin="STAT2" pad="6"/>
<connect gate="G$1" pin="TS" pad="9"/>
<connect gate="G$1" pin="USB_PWR" pad="2"/>
<connect gate="G$1" pin="USB_SEL" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="antennas">
<packages>
<package name="TI_2.4GHZ_MIFA">
<rectangle x1="2.7" y1="-0.54" x2="3.2" y2="3.4" layer="1"/>
<rectangle x1="0.5" y1="3.4" x2="3.2" y2="3.9" layer="1"/>
<rectangle x1="0.5" y1="0.76" x2="1" y2="3.4" layer="1"/>
<rectangle x1="-1.5" y1="0.76" x2="0.5" y2="1.26" layer="1"/>
<rectangle x1="-2" y1="0.76" x2="-1.5" y2="3.4" layer="1"/>
<rectangle x1="-4.2" y1="3.4" x2="-1.5" y2="3.9" layer="1"/>
<rectangle x1="-4.2" y1="0.76" x2="-3.7" y2="3.4" layer="1"/>
<rectangle x1="-6.2" y1="0.76" x2="-4.2" y2="1.26" layer="1"/>
<rectangle x1="-6.7" y1="0.76" x2="-6.2" y2="3.4" layer="1"/>
<rectangle x1="-11.2" y1="3.4" x2="-6.2" y2="3.9" layer="1"/>
<rectangle x1="-8.9" y1="-1.5" x2="-8.4" y2="3.4" layer="1"/>
<rectangle x1="-11.2" y1="-1.5" x2="-10.3" y2="3.4" layer="1"/>
<wire x1="-11.5" y1="-1" x2="-8.1" y2="-1" width="0.05" layer="21"/>
<smd name="FEED" x="-8.65" y="-1.26" dx="0.2" dy="0.1" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="GND" x="-10.75" y="-1.26" dx="0.2" dy="0.1" layer="1" stop="no" thermals="no" cream="no"/>
</package>
<package name="TI_2.4GHZ_MIFA_LEFT">
<rectangle x1="-11.85" y1="0.56" x2="-11.35" y2="4.5" layer="1"/>
<rectangle x1="-11.85" y1="4.5" x2="-9.15" y2="5" layer="1"/>
<rectangle x1="-9.65" y1="1.86" x2="-9.15" y2="4.5" layer="1"/>
<rectangle x1="-9.15" y1="1.86" x2="-7.15" y2="2.36" layer="1"/>
<rectangle x1="-7.15" y1="1.86" x2="-6.65" y2="4.5" layer="1"/>
<rectangle x1="-7.15" y1="4.5" x2="-4.45" y2="5" layer="1"/>
<rectangle x1="-4.95" y1="1.86" x2="-4.45" y2="4.5" layer="1"/>
<rectangle x1="-4.45" y1="1.86" x2="-2.45" y2="2.36" layer="1"/>
<rectangle x1="-2.45" y1="1.86" x2="-1.95" y2="4.5" layer="1"/>
<rectangle x1="-2.45" y1="4.5" x2="2.55" y2="5" layer="1"/>
<rectangle x1="-0.25" y1="-0.1" x2="0.25" y2="4.8" layer="1"/>
<rectangle x1="1.65" y1="-0.1" x2="2.55" y2="4.8" layer="1"/>
<wire x1="2.85" y1="0.1" x2="-0.55" y2="0.1" width="0.05" layer="22"/>
<smd name="FEED" x="0" y="-0.06" dx="0.2" dy="0.1" layer="1" stop="no" thermals="no" cream="no"/>
<smd name="GND" x="2.1" y="-0.06" dx="0.2" dy="0.1" layer="1" stop="no" thermals="no" cream="no"/>
</package>
</packages>
<symbols>
<symbol name="TI_2.4GHZ_MIFA">
<wire x1="0" y1="0" x2="0" y2="15.24" width="2.54" layer="94"/>
<wire x1="0" y1="15.24" x2="-10.16" y2="15.24" width="2.54" layer="94"/>
<wire x1="-10.16" y1="0" x2="-10.16" y2="15.24" width="2.54" layer="94"/>
<wire x1="0" y1="15.24" x2="7.62" y2="15.24" width="2.54" layer="94"/>
<wire x1="7.62" y1="15.24" x2="7.62" y2="7.62" width="2.54" layer="94"/>
<wire x1="7.62" y1="7.62" x2="15.24" y2="7.62" width="2.54" layer="94"/>
<wire x1="15.24" y1="7.62" x2="15.24" y2="15.24" width="2.54" layer="94"/>
<wire x1="15.24" y1="15.24" x2="22.86" y2="15.24" width="2.54" layer="94"/>
<wire x1="22.86" y1="15.24" x2="22.86" y2="7.62" width="2.54" layer="94"/>
<wire x1="22.86" y1="7.62" x2="30.48" y2="7.62" width="2.54" layer="94"/>
<wire x1="30.48" y1="7.62" x2="30.48" y2="15.24" width="2.54" layer="94"/>
<wire x1="30.48" y1="15.24" x2="38.1" y2="15.24" width="2.54" layer="94"/>
<wire x1="38.1" y1="15.24" x2="38.1" y2="2.54" width="2.54" layer="94"/>
<pin name="GND" x="-10.16" y="0" visible="off" length="point" rot="R90"/>
<pin name="FEED" x="0" y="0" visible="off" length="point" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TI_2.4GHZ_MIFA" prefix="A">
<gates>
<gate name="G$1" symbol="TI_2.4GHZ_MIFA" x="0" y="0"/>
</gates>
<devices>
<device name="RIGHT" package="TI_2.4GHZ_MIFA">
<connects>
<connect gate="G$1" pin="FEED" pad="FEED"/>
<connect gate="G$1" pin="GND" pad="GND"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LEFT" package="TI_2.4GHZ_MIFA_LEFT">
<connects>
<connect gate="G$1" pin="FEED" pad="FEED"/>
<connect gate="G$1" pin="GND" pad="GND"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="53261-03">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 1.25 mm (.049 inch) pitch header&lt;p&gt;
SMT&lt;p&gt;
right angle</description>
<wire x1="-2.65" y1="-1.375" x2="-2.125" y2="-1.375" width="0.2032" layer="21"/>
<wire x1="-2.125" y1="-1.375" x2="2.125" y2="-1.375" width="0.2032" layer="21"/>
<wire x1="2.125" y1="-1.375" x2="2.65" y2="-1.375" width="0.2032" layer="21"/>
<wire x1="2.65" y1="-1.375" x2="2.65" y2="2.625" width="0.2032" layer="21"/>
<wire x1="2.65" y1="2.625" x2="2.5" y2="2.625" width="0.2032" layer="21"/>
<wire x1="2.5" y1="2.625" x2="-2.5" y2="2.625" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="2.625" x2="-2.65" y2="2.625" width="0.2032" layer="21"/>
<wire x1="-2.65" y1="2.625" x2="-2.65" y2="-1.375" width="0.2032" layer="21"/>
<wire x1="-2.625" y1="1.625" x2="-2.125" y2="1.625" width="0.0508" layer="21"/>
<wire x1="-2.125" y1="1.625" x2="-1.875" y2="1.625" width="0.0508" layer="21"/>
<wire x1="-1.875" y1="1.625" x2="-1.875" y2="1" width="0.0508" layer="21"/>
<wire x1="-1.875" y1="1" x2="1.875" y2="1" width="0.0508" layer="21"/>
<wire x1="1.875" y1="1.625" x2="2.125" y2="1.625" width="0.0508" layer="21"/>
<wire x1="2.125" y1="1.625" x2="2.625" y2="1.625" width="0.0508" layer="21"/>
<wire x1="1.875" y1="1.625" x2="1.875" y2="1" width="0.0508" layer="21"/>
<wire x1="-2.625" y1="-0.75" x2="-2.125" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="-2.125" y1="-0.75" x2="-2.125" y2="-1.375" width="0.0508" layer="21"/>
<wire x1="2.125" y1="-0.75" x2="2.625" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="2.125" y1="-0.75" x2="2.125" y2="-1.375" width="0.0508" layer="21"/>
<wire x1="-2.125" y1="1.625" x2="-2.125" y2="2.25" width="0.0508" layer="21"/>
<wire x1="-2.125" y1="2.25" x2="2.125" y2="2.25" width="0.0508" layer="21"/>
<wire x1="2.125" y1="2.25" x2="2.125" y2="1.625" width="0.0508" layer="21"/>
<wire x1="-2.125" y1="2.25" x2="-2.5" y2="2.625" width="0.0508" layer="21"/>
<wire x1="2.125" y1="2.25" x2="2.5" y2="2.625" width="0.0508" layer="21"/>
<wire x1="-1.5" y1="-1.25" x2="-1.5" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="-1.5" y1="-0.75" x2="-1" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="-1" y1="-0.75" x2="-1" y2="-1.25" width="0.0508" layer="21"/>
<wire x1="-0.25" y1="-1.25" x2="-0.25" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="-0.25" y1="-0.75" x2="0.25" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="0.25" y1="-0.75" x2="0.25" y2="-1.25" width="0.0508" layer="21"/>
<wire x1="1" y1="-1.25" x2="1" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="1" y1="-0.75" x2="1.5" y2="-0.75" width="0.0508" layer="21"/>
<wire x1="1.5" y1="-0.75" x2="1.5" y2="-1.25" width="0.0508" layer="21"/>
<wire x1="-2.75" y1="2.25" x2="-4.625" y2="2.25" width="0.2032" layer="51"/>
<wire x1="-4.625" y1="2.25" x2="-4.625" y2="-0.75" width="0.2032" layer="51"/>
<wire x1="-4.625" y1="-0.75" x2="-2.75" y2="-0.75" width="0.2032" layer="51"/>
<wire x1="2.75" y1="-0.75" x2="4.625" y2="-0.75" width="0.2032" layer="51"/>
<wire x1="4.625" y1="-0.75" x2="4.625" y2="2.25" width="0.2032" layer="51"/>
<wire x1="4.625" y1="2.25" x2="2.75" y2="2.25" width="0.2032" layer="51"/>
<smd name="1" x="1.25" y="-2.5" dx="0.8" dy="2" layer="1"/>
<smd name="2" x="0" y="-2.5" dx="0.8" dy="2" layer="1"/>
<smd name="3" x="-1.25" y="-2.5" dx="0.8" dy="2" layer="1"/>
<smd name="S1" x="3.75" y="0.625" dx="2.1" dy="3" layer="1"/>
<smd name="S2" x="-3.75" y="0.625" dx="2.1" dy="3" layer="1"/>
<text x="-2.5" y="2.875" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.25" y="-3" size="1.27" layer="27">&gt;VALUE</text>
<text x="3.125" y="-0.25" size="1.9304" layer="51">1</text>
<rectangle x1="-1.5" y1="1" x2="-1" y2="1.875" layer="21"/>
<rectangle x1="-0.25" y1="1" x2="0.25" y2="1.875" layer="21"/>
<rectangle x1="1" y1="1" x2="1.5" y2="1.875" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="53261-0371_3PIN">
<wire x1="1.905" y1="6.35" x2="-1.905" y2="6.35" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-6.35" x2="-1.905" y2="6.35" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-6.35" x2="1.905" y2="-6.35" width="0.254" layer="94"/>
<wire x1="1.905" y1="6.35" x2="1.905" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="0.635" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-0.635" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="0.635" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="5.08" x2="0.635" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="-5.08" x2="0.635" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.985" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="-5.08" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="S1" x="-5.08" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-5.08" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="S2" x="-5.08" y="-5.08" visible="pad" length="short" direction="pas"/>
<text x="-6.223" y="-8.636" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="53261-0371">
<gates>
<gate name="G$1" symbol="53261-0371_3PIN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="53261-03">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A3L-LOC">
<wire x1="288.29" y1="3.81" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="3.81" x2="373.38" y2="3.81" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="383.54" y2="3.81" width="0.1016" layer="94"/>
<wire x1="383.54" y1="3.81" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="383.54" y1="8.89" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="383.54" y1="13.97" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="383.54" y1="19.05" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="3.81" x2="288.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="24.13" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="342.265" y1="24.13" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="373.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="342.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="342.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<text x="344.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="344.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="357.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="343.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="387.35" y2="260.35" columns="8" rows="5" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A3L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A3, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A3L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="texas" deviceset="CC2540" device=""/>
<part name="C1" library="smd-ipc" deviceset="C0402" device="" value="18p"/>
<part name="C2" library="smd-ipc" deviceset="C0402" device="" value="18p"/>
<part name="C3" library="smd-ipc" deviceset="C0402" device="" value="1p"/>
<part name="C6" library="smd-ipc" deviceset="C0402" device="" value="1p"/>
<part name="C7" library="smd-ipc" deviceset="C0402" device="" value="DNM"/>
<part name="C9" library="smd-ipc" deviceset="C0402" device="" value="1p"/>
<part name="SUPPLY1" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY2" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY3" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY4" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY5" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY6" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY7" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY8" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY9" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY10" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY11" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY12" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY13" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY14" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY15" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY16" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY17" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY18" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY19" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY20" library="supply2" deviceset="GND" device=""/>
<part name="L1" library="smd-ipc" deviceset="L0402" device="" value="2n"/>
<part name="L2" library="smd-ipc" deviceset="L0402" device="" value="2n"/>
<part name="R1" library="smd-ipc" deviceset="R0402" device="" value="56k"/>
<part name="SUPPLY21" library="supply2" deviceset="GND" device=""/>
<part name="C4" library="smd-ipc" deviceset="C0402" device="" value="220p"/>
<part name="C5" library="smd-ipc" deviceset="C0402" device="" value="100n"/>
<part name="SUPPLY22" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY23" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY24" library="supply2" deviceset="VDD" device=""/>
<part name="C10" library="smd-ipc" deviceset="C0402" device="" value="100n"/>
<part name="C11" library="smd-ipc" deviceset="C0402" device="" value="100n"/>
<part name="SUPPLY25" library="supply2" deviceset="VDD" device=""/>
<part name="SUPPLY26" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY27" library="supply2" deviceset="GND" device=""/>
<part name="Q1" library="crystal" deviceset="FA-" device="128"/>
<part name="SUPPLY28" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY29" library="supply2" deviceset="GND" device=""/>
<part name="C12" library="smd-ipc" deviceset="C0402" device="" value="12p"/>
<part name="C13" library="smd-ipc" deviceset="C0402" device="" value="12p"/>
<part name="SUPPLY30" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY31" library="supply2" deviceset="GND" device=""/>
<part name="C14" library="smd-ipc" deviceset="C0402" device="" value="1u"/>
<part name="C15" library="smd-ipc" deviceset="C0402" device="" value="1u"/>
<part name="SUPPLY36" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY37" library="supply2" deviceset="GND" device=""/>
<part name="C16" library="smd-ipc" deviceset="C0402" device="" value="100n"/>
<part name="SUPPLY38" library="supply2" deviceset="VDD" device=""/>
<part name="SUPPLY39" library="supply2" deviceset="VDD" device=""/>
<part name="SUPPLY40" library="supply2" deviceset="GND" device=""/>
<part name="C17" library="smd-ipc" deviceset="C0402" device=""/>
<part name="SUPPLY41" library="supply2" deviceset="VDD" device=""/>
<part name="SUPPLY42" library="supply2" deviceset="GND" device="" value="100n"/>
<part name="JP1" library="pinhead" deviceset="PINHD-2X5" device="1.27_SMD"/>
<part name="SUPPLY32" library="supply2" deviceset="VDD" device=""/>
<part name="SUPPLY33" library="supply2" deviceset="GND" device=""/>
<part name="R3" library="smd-ipc" deviceset="R0402" device="" value="2.7k"/>
<part name="C18" library="smd-ipc" deviceset="C0402" device="" value="100n"/>
<part name="SUPPLY34" library="supply2" deviceset="GND" device=""/>
<part name="Q2" library="crystal" deviceset="MC-306" device=""/>
<part name="C19" library="smd-ipc" deviceset="C0402" device="" value="15p"/>
<part name="C20" library="smd-ipc" deviceset="C0402" device="" value="15p"/>
<part name="SUPPLY35" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY43" library="supply2" deviceset="GND" device=""/>
<part name="JP4" library="pinhead" deviceset="PINHD-1X4" device=""/>
<part name="SUPPLY44" library="supply2" deviceset="VDD" device=""/>
<part name="SUPPLY45" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY48" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY49" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY50" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY46" library="supply2" deviceset="GND" device=""/>
<part name="U1" library="national-semiconductor" deviceset="LM3658" device=""/>
<part name="R4" library="smd-ipc" deviceset="R0402" device="" value="?"/>
<part name="SUPPLY47" library="supply2" deviceset="GND" device=""/>
<part name="C21" library="smd-ipc" deviceset="C0402" device="" value="4.7u"/>
<part name="SUPPLY51" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY52" library="supply2" deviceset="GND" device=""/>
<part name="C23" library="smd-ipc" deviceset="C0402" device="" value="100n"/>
<part name="C24" library="smd-ipc" deviceset="C0402" device="" value="470n"/>
<part name="SUPPLY53" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY54" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY55" library="supply2" deviceset="VDD" device=""/>
<part name="U2" library="texas" deviceset="TPS71530" device=""/>
<part name="SUPPLY56" library="supply2" deviceset="GND" device=""/>
<part name="U$1" library="con-molex" deviceset="53261-0371" device=""/>
<part name="SUPPLY57" library="supply2" deviceset="GND" device=""/>
<part name="R7" library="smd-ipc" deviceset="R0402" device="" value="0"/>
<part name="R8" library="smd-ipc" deviceset="R0402" device="" value="10k"/>
<part name="SUPPLY59" library="supply2" deviceset="GND" device=""/>
<part name="R9" library="smd-ipc" deviceset="R0402" device="" value="10k"/>
<part name="SUPPLY60" library="supply2" deviceset="GND" device=""/>
<part name="C22" library="smd-ipc" deviceset="C0402" device="" value="1u"/>
<part name="SUPPLY61" library="supply2" deviceset="GND" device=""/>
<part name="R5" library="smd-ipc" deviceset="R0603" device=""/>
<part name="R6" library="smd-ipc" deviceset="R0603" device=""/>
<part name="R2" library="smd-ipc" deviceset="R0603" device=""/>
<part name="C25" library="smd-ipc" deviceset="C0603" device=""/>
<part name="SUPPLY62" library="supply2" deviceset="GND" device=""/>
<part name="A1" library="antennas" deviceset="TI_2.4GHZ_MIFA" device="LEFT"/>
<part name="SUPPLY63" library="supply2" deviceset="GND" device=""/>
<part name="R10" library="smd-ipc" deviceset="R0603" device=""/>
<part name="R11" library="smd-ipc" deviceset="R0603" device=""/>
<part name="JP5" library="pinhead" deviceset="PINHD-1X2" device=""/>
<part name="SUPPLY58" library="supply2" deviceset="GND" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X9" device=""/>
<part name="JP3" library="pinhead" deviceset="PINHD-1X8" device=""/>
<part name="FRAME1" library="frames" deviceset="A3L-LOC" device=""/>
<part name="L3" library="smd-ipc" deviceset="L0402" device="" value="1n"/>
<part name="L4" library="smd-ipc" deviceset="L0402" device="" value="3n"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="-12.7" y="10.16"/>
<instance part="IC1" gate="EXP" x="35.56" y="-50.8" rot="R180"/>
<instance part="C1" gate="G$1" x="43.18" y="12.7" rot="R90"/>
<instance part="C2" gate="G$1" x="45.72" y="5.08" rot="R270"/>
<instance part="C3" gate="G$1" x="55.88" y="20.32"/>
<instance part="C6" gate="G$1" x="68.58" y="5.08" rot="R270"/>
<instance part="C7" gate="G$1" x="86.36" y="2.54" rot="R180"/>
<instance part="C9" gate="G$1" x="106.68" y="5.08"/>
<instance part="SUPPLY1" gate="GND" x="55.88" y="-12.7"/>
<instance part="SUPPLY2" gate="GND" x="55.88" y="25.4" rot="R180"/>
<instance part="SUPPLY3" gate="GND" x="86.36" y="-2.54"/>
<instance part="SUPPLY4" gate="GND" x="106.68" y="-2.54"/>
<instance part="SUPPLY5" gate="GND" x="15.24" y="-58.42"/>
<instance part="SUPPLY6" gate="GND" x="17.78" y="-58.42"/>
<instance part="SUPPLY7" gate="GND" x="20.32" y="-58.42"/>
<instance part="SUPPLY8" gate="GND" x="22.86" y="-58.42"/>
<instance part="SUPPLY9" gate="GND" x="25.4" y="-58.42"/>
<instance part="SUPPLY10" gate="GND" x="27.94" y="-58.42"/>
<instance part="SUPPLY11" gate="GND" x="30.48" y="-58.42"/>
<instance part="SUPPLY12" gate="GND" x="33.02" y="-58.42"/>
<instance part="SUPPLY13" gate="GND" x="35.56" y="-58.42"/>
<instance part="SUPPLY14" gate="GND" x="38.1" y="-58.42"/>
<instance part="SUPPLY15" gate="GND" x="40.64" y="-58.42"/>
<instance part="SUPPLY16" gate="GND" x="43.18" y="-58.42"/>
<instance part="SUPPLY17" gate="GND" x="45.72" y="-58.42"/>
<instance part="SUPPLY18" gate="GND" x="48.26" y="-58.42"/>
<instance part="SUPPLY19" gate="GND" x="50.8" y="-58.42"/>
<instance part="SUPPLY20" gate="GND" x="53.34" y="-58.42"/>
<instance part="L1" gate="G$1" x="55.88" y="-2.54"/>
<instance part="L2" gate="G$1" x="66.04" y="12.7" rot="R90"/>
<instance part="R1" gate="G$1" x="33.02" y="38.1"/>
<instance part="SUPPLY21" gate="GND" x="40.64" y="38.1" rot="R90"/>
<instance part="C4" gate="G$1" x="27.94" y="15.24" rot="R90"/>
<instance part="C5" gate="G$1" x="27.94" y="22.86" rot="R90"/>
<instance part="SUPPLY22" gate="GND" x="35.56" y="15.24" rot="R90"/>
<instance part="SUPPLY23" gate="GND" x="35.56" y="22.86" rot="R90"/>
<instance part="SUPPLY24" gate="G$1" x="25.4" y="27.94"/>
<instance part="C10" gate="G$1" x="22.86" y="-17.78" rot="R180"/>
<instance part="C11" gate="G$1" x="27.94" y="-15.24"/>
<instance part="SUPPLY25" gate="G$1" x="25.4" y="-7.62"/>
<instance part="SUPPLY26" gate="GND" x="22.86" y="-22.86"/>
<instance part="SUPPLY27" gate="GND" x="27.94" y="-22.86"/>
<instance part="Q1" gate="G$1" x="40.64" y="-22.86"/>
<instance part="SUPPLY28" gate="GND" x="43.18" y="-30.48"/>
<instance part="SUPPLY29" gate="GND" x="40.64" y="-30.48"/>
<instance part="C12" gate="G$1" x="48.26" y="-25.4"/>
<instance part="C13" gate="G$1" x="35.56" y="-27.94" rot="R180"/>
<instance part="SUPPLY30" gate="GND" x="35.56" y="-33.02"/>
<instance part="SUPPLY31" gate="GND" x="48.26" y="-33.02"/>
<instance part="C14" gate="G$1" x="-27.94" y="35.56" rot="R270"/>
<instance part="C15" gate="G$1" x="-27.94" y="40.64" rot="R270"/>
<instance part="SUPPLY36" gate="GND" x="-35.56" y="35.56" rot="R270"/>
<instance part="SUPPLY37" gate="GND" x="-35.56" y="40.64" rot="R270"/>
<instance part="C16" gate="G$1" x="5.08" y="33.02" rot="R90"/>
<instance part="SUPPLY38" gate="G$1" x="0" y="38.1"/>
<instance part="SUPPLY39" gate="G$1" x="-20.32" y="43.18"/>
<instance part="SUPPLY40" gate="GND" x="12.7" y="33.02" rot="R90"/>
<instance part="C17" gate="G$1" x="-48.26" y="-15.24" rot="R180"/>
<instance part="SUPPLY41" gate="G$1" x="-48.26" y="-7.62"/>
<instance part="SUPPLY42" gate="GND" x="-48.26" y="-20.32"/>
<instance part="JP1" gate="A" x="-93.98" y="-45.72"/>
<instance part="SUPPLY32" gate="G$1" x="-81.28" y="-35.56"/>
<instance part="SUPPLY33" gate="GND" x="-106.68" y="-45.72"/>
<instance part="R3" gate="G$1" x="-17.78" y="-55.88"/>
<instance part="C18" gate="G$1" x="-10.16" y="-58.42"/>
<instance part="SUPPLY34" gate="GND" x="-10.16" y="-66.04"/>
<instance part="Q2" gate="P" x="20.32" y="60.96"/>
<instance part="C19" gate="G$1" x="27.94" y="58.42"/>
<instance part="C20" gate="G$1" x="12.7" y="55.88" rot="R180"/>
<instance part="SUPPLY35" gate="GND" x="12.7" y="50.8"/>
<instance part="SUPPLY43" gate="GND" x="27.94" y="50.8"/>
<instance part="JP4" gate="A" x="-73.66" y="43.18" rot="R180"/>
<instance part="SUPPLY44" gate="G$1" x="-63.5" y="50.8"/>
<instance part="SUPPLY45" gate="GND" x="-63.5" y="35.56"/>
<instance part="SUPPLY48" gate="GND" x="-45.72" y="15.24" rot="R270"/>
<instance part="SUPPLY49" gate="GND" x="-45.72" y="12.7" rot="R270"/>
<instance part="SUPPLY50" gate="GND" x="-45.72" y="17.78" rot="R270"/>
<instance part="SUPPLY46" gate="GND" x="-45.72" y="20.32" rot="R270"/>
<instance part="U1" gate="G$1" x="-60.96" y="99.06"/>
<instance part="R4" gate="G$1" x="-30.48" y="83.82" rot="R270"/>
<instance part="SUPPLY47" gate="GND" x="-30.48" y="76.2"/>
<instance part="C21" gate="G$1" x="-86.36" y="99.06" rot="R180"/>
<instance part="SUPPLY51" gate="GND" x="-78.74" y="78.74"/>
<instance part="SUPPLY52" gate="GND" x="30.48" y="96.52"/>
<instance part="C23" gate="G$1" x="20.32" y="104.14" rot="R180"/>
<instance part="C24" gate="G$1" x="66.04" y="104.14" rot="R180"/>
<instance part="SUPPLY53" gate="GND" x="20.32" y="99.06"/>
<instance part="SUPPLY54" gate="GND" x="66.04" y="99.06"/>
<instance part="SUPPLY55" gate="G$1" x="66.04" y="111.76"/>
<instance part="U2" gate="G$1" x="43.18" y="104.14"/>
<instance part="SUPPLY56" gate="GND" x="116.84" y="22.86"/>
<instance part="U$1" gate="G$1" x="7.62" y="96.52"/>
<instance part="SUPPLY57" gate="GND" x="-5.08" y="88.9"/>
<instance part="R7" gate="G$1" x="-17.78" y="96.52"/>
<instance part="R8" gate="G$1" x="-22.86" y="83.82" rot="R270"/>
<instance part="SUPPLY59" gate="GND" x="-22.86" y="76.2"/>
<instance part="R9" gate="G$1" x="-12.7" y="83.82" rot="R270"/>
<instance part="SUPPLY60" gate="GND" x="-12.7" y="76.2"/>
<instance part="C22" gate="G$1" x="-33.02" y="116.84" rot="R180"/>
<instance part="SUPPLY61" gate="GND" x="-33.02" y="111.76"/>
<instance part="R5" gate="G$1" x="-38.1" y="83.82" rot="R90"/>
<instance part="R6" gate="G$1" x="-45.72" y="83.82" rot="R90"/>
<instance part="R2" gate="G$1" x="-91.44" y="-60.96"/>
<instance part="C25" gate="G$1" x="-96.52" y="99.06" rot="R180"/>
<instance part="SUPPLY62" gate="GND" x="-96.52" y="93.98"/>
<instance part="A1" gate="G$1" x="127" y="27.94"/>
<instance part="SUPPLY63" gate="GND" x="-86.36" y="93.98"/>
<instance part="R10" gate="G$1" x="-78.74" y="104.14"/>
<instance part="R11" gate="G$1" x="-78.74" y="109.22"/>
<instance part="JP5" gate="G$1" x="-116.84" y="104.14" rot="R180"/>
<instance part="SUPPLY58" gate="GND" x="-109.22" y="93.98"/>
<instance part="JP2" gate="A" x="-40.64" y="-50.8" rot="MR270"/>
<instance part="JP3" gate="A" x="-10.16" y="-50.8" rot="MR270"/>
<instance part="FRAME1" gate="G$1" x="-177.8" y="-114.3"/>
<instance part="L3" gate="G$1" x="96.52" y="10.16" rot="R90"/>
<instance part="L4" gate="G$1" x="116.84" y="10.16" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="RF_P"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="20.32" y1="7.62" x2="40.64" y2="7.62" width="0.1524" layer="91"/>
<wire x1="40.64" y1="7.62" x2="40.64" y2="5.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="C6" gate="G$1" pin="2"/>
<wire x1="48.26" y1="5.08" x2="55.88" y2="5.08" width="0.1524" layer="91"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="55.88" y1="5.08" x2="63.5" y2="5.08" width="0.1524" layer="91"/>
<junction x="55.88" y="5.08"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="73.66" y1="12.7" x2="73.66" y2="10.16" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="73.66" y1="5.08" x2="71.12" y2="5.08" width="0.1524" layer="91"/>
<wire x1="73.66" y1="5.08" x2="73.66" y2="10.16" width="0.1524" layer="91"/>
<wire x1="73.66" y1="10.16" x2="86.36" y2="10.16" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="86.36" y1="7.62" x2="86.36" y2="10.16" width="0.1524" layer="91"/>
<wire x1="86.36" y1="10.16" x2="88.9" y2="10.16" width="0.1524" layer="91"/>
<junction x="73.66" y="10.16"/>
<junction x="86.36" y="10.16"/>
<pinref part="L2" gate="G$1" pin="2"/>
<pinref part="L3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="RF_N"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="20.32" y1="10.16" x2="40.64" y2="10.16" width="0.1524" layer="91"/>
<wire x1="40.64" y1="10.16" x2="40.64" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="C3" gate="G$1" pin="1"/>
<pinref part="SUPPLY2" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="1"/>
<pinref part="SUPPLY3" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="SUPPLY4" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@16"/>
<pinref part="SUPPLY5" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@15"/>
<pinref part="SUPPLY6" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@14"/>
<pinref part="SUPPLY7" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@13"/>
<pinref part="SUPPLY8" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@12"/>
<pinref part="SUPPLY9" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@11"/>
<pinref part="SUPPLY10" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@10"/>
<pinref part="SUPPLY11" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@9"/>
<pinref part="SUPPLY12" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@8"/>
<pinref part="SUPPLY13" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@7"/>
<pinref part="SUPPLY14" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@6"/>
<pinref part="SUPPLY15" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@5"/>
<pinref part="SUPPLY16" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@4"/>
<pinref part="SUPPLY17" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@3"/>
<pinref part="SUPPLY18" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@2"/>
<pinref part="SUPPLY19" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="EXP" pin="EXP16@1"/>
<pinref part="SUPPLY20" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="L1" gate="G$1" pin="2"/>
<pinref part="SUPPLY1" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="SUPPLY21" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<pinref part="SUPPLY23" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="SUPPLY22" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="1"/>
<pinref part="SUPPLY26" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="SUPPLY27" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="4"/>
<pinref part="SUPPLY28" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="2"/>
<pinref part="SUPPLY29" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="SUPPLY31" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="1"/>
<pinref part="SUPPLY30" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C14" gate="G$1" pin="2"/>
<pinref part="SUPPLY36" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="SUPPLY37" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="2"/>
<pinref part="SUPPLY40" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="1"/>
<pinref part="SUPPLY42" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY33" gate="GND" pin="GND"/>
<wire x1="-106.68" y1="-43.18" x2="-106.68" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="-106.68" y1="-40.64" x2="-96.52" y2="-40.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="SUPPLY34" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C20" gate="G$1" pin="1"/>
<pinref part="SUPPLY35" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<pinref part="SUPPLY43" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="JP4" gate="A" pin="1"/>
<pinref part="SUPPLY45" gate="GND" pin="GND"/>
<wire x1="-63.5" y1="38.1" x2="-71.12" y2="38.1" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="2"/>
<wire x1="-71.12" y1="40.64" x2="-63.5" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="40.64" x2="-63.5" y2="38.1" width="0.1524" layer="91"/>
<junction x="-63.5" y="38.1"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="USB_N"/>
<pinref part="SUPPLY48" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="DVDD_USB"/>
<pinref part="SUPPLY49" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="USB_P"/>
<pinref part="SUPPLY50" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="DGND_USB"/>
<pinref part="SUPPLY46" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<pinref part="SUPPLY47" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="1"/>
<pinref part="SUPPLY63" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY51" gate="GND" pin="GND"/>
<pinref part="U1" gate="G$1" pin="EN_B"/>
<wire x1="-78.74" y1="81.28" x2="-78.74" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-78.74" y1="86.36" x2="-78.74" y2="88.9" width="0.1524" layer="91"/>
<wire x1="-78.74" y1="88.9" x2="-78.74" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="-78.74" y1="93.98" x2="-73.66" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="88.9" x2="-78.74" y2="88.9" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND_PAD"/>
<wire x1="-73.66" y1="86.36" x2="-78.74" y2="86.36" width="0.1524" layer="91"/>
<junction x="-78.74" y="86.36"/>
<junction x="-78.74" y="88.9"/>
</segment>
<segment>
<pinref part="SUPPLY53" gate="GND" pin="GND"/>
<pinref part="SUPPLY53" gate="GND" pin="GND"/>
<pinref part="C23" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="1"/>
<pinref part="SUPPLY54" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY52" gate="GND" pin="GND"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="30.48" y1="99.06" x2="33.02" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="1"/>
<wire x1="2.54" y1="99.06" x2="-5.08" y2="99.06" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="99.06" x2="-5.08" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SUPPLY57" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="SUPPLY59" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="SUPPLY60" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="1"/>
<pinref part="SUPPLY61" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="C25" gate="G$1" pin="1"/>
<pinref part="SUPPLY62" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="SUPPLY56" gate="GND" pin="GND"/>
<pinref part="A1" gate="G$1" pin="GND"/>
<wire x1="116.84" y1="25.4" x2="116.84" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="JP5" gate="G$1" pin="1"/>
<pinref part="SUPPLY58" gate="GND" pin="GND"/>
<wire x1="-114.3" y1="101.6" x2="-109.22" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="101.6" x2="-109.22" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<pinref part="L2" gate="G$1" pin="1"/>
<wire x1="48.26" y1="12.7" x2="55.88" y2="12.7" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="58.42" y1="12.7" x2="55.88" y2="12.7" width="0.1524" layer="91"/>
<wire x1="55.88" y1="12.7" x2="55.88" y2="15.24" width="0.1524" layer="91"/>
<junction x="55.88" y="12.7"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="RBIAS"/>
<wire x1="20.32" y1="20.32" x2="22.86" y2="20.32" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="27.94" y1="38.1" x2="22.86" y2="38.1" width="0.1524" layer="91"/>
<wire x1="22.86" y1="38.1" x2="22.86" y2="20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VDD" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="AVDD2"/>
<pinref part="IC1" gate="G$1" pin="AVDD4"/>
<wire x1="20.32" y1="12.7" x2="20.32" y2="15.24" width="0.1524" layer="91"/>
<wire x1="20.32" y1="15.24" x2="20.32" y2="17.78" width="0.1524" layer="91"/>
<wire x1="20.32" y1="17.78" x2="25.4" y2="17.78" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="25.4" y1="22.86" x2="25.4" y2="17.78" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="AVDD1"/>
<junction x="20.32" y="15.24"/>
<junction x="20.32" y="17.78"/>
<junction x="25.4" y="17.78"/>
<wire x1="25.4" y1="17.78" x2="25.4" y2="15.24" width="0.1524" layer="91"/>
<pinref part="SUPPLY24" gate="G$1" pin="VDD"/>
<wire x1="25.4" y1="25.4" x2="25.4" y2="22.86" width="0.1524" layer="91"/>
<junction x="25.4" y="22.86"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="AVDD5"/>
<wire x1="20.32" y1="-2.54" x2="22.86" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="22.86" y1="-2.54" x2="22.86" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="22.86" y1="-12.7" x2="22.86" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="SUPPLY25" gate="G$1" pin="VDD"/>
<wire x1="22.86" y1="-10.16" x2="25.4" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="AVDD3"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="25.4" y1="-10.16" x2="27.94" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="20.32" y1="5.08" x2="27.94" y2="5.08" width="0.1524" layer="91"/>
<wire x1="27.94" y1="5.08" x2="27.94" y2="-10.16" width="0.1524" layer="91"/>
<junction x="27.94" y="-10.16"/>
<wire x1="27.94" y1="-10.16" x2="27.94" y2="-12.7" width="0.1524" layer="91"/>
<junction x="22.86" y="-10.16"/>
<junction x="25.4" y="-10.16"/>
</segment>
<segment>
<pinref part="C15" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="DVDD1"/>
<wire x1="-25.4" y1="40.64" x2="-20.32" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="40.64" x2="-20.32" y2="30.48" width="0.1524" layer="91"/>
<pinref part="SUPPLY39" gate="G$1" pin="VDD"/>
<junction x="-20.32" y="40.64"/>
</segment>
<segment>
<pinref part="SUPPLY38" gate="G$1" pin="VDD"/>
<pinref part="IC1" gate="G$1" pin="AVDD6"/>
<wire x1="0" y1="35.56" x2="0" y2="33.02" width="0.1524" layer="91"/>
<wire x1="0" y1="30.48" x2="0" y2="33.02" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="0" y1="33.02" x2="2.54" y2="33.02" width="0.1524" layer="91"/>
<junction x="0" y="33.02"/>
</segment>
<segment>
<pinref part="SUPPLY41" gate="G$1" pin="VDD"/>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="IC1" gate="G$1" pin="DVDD2"/>
<wire x1="-48.26" y1="-10.16" x2="-43.18" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-10.16" x2="-43.18" y2="-2.54" width="0.1524" layer="91"/>
<junction x="-48.26" y="-10.16"/>
</segment>
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<pinref part="SUPPLY32" gate="G$1" pin="VDD"/>
<wire x1="-88.9" y1="-40.64" x2="-81.28" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="-40.64" x2="-81.28" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="-60.96" x2="-81.28" y2="-60.96" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="-60.96" x2="-81.28" y2="-40.64" width="0.1524" layer="91"/>
<junction x="-81.28" y="-40.64"/>
<pinref part="R2" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="SUPPLY44" gate="G$1" pin="VDD"/>
<pinref part="JP4" gate="A" pin="3"/>
<wire x1="-63.5" y1="48.26" x2="-63.5" y2="45.72" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="45.72" x2="-63.5" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="43.18" x2="-71.12" y2="43.18" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="4"/>
<wire x1="-71.12" y1="45.72" x2="-63.5" y2="45.72" width="0.1524" layer="91"/>
<junction x="-63.5" y="45.72"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="2"/>
<wire x1="55.88" y1="109.22" x2="66.04" y2="109.22" width="0.1524" layer="91"/>
<pinref part="SUPPLY55" gate="G$1" pin="VDD"/>
<junction x="66.04" y="109.22"/>
<pinref part="U2" gate="G$1" pin="OUT"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="XOSC_Q1"/>
<wire x1="20.32" y1="0" x2="38.1" y2="0" width="0.1524" layer="91"/>
<wire x1="38.1" y1="0" x2="38.1" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="1"/>
<pinref part="C13" gate="G$1" pin="2"/>
<wire x1="35.56" y1="-22.86" x2="38.1" y2="-22.86" width="0.1524" layer="91"/>
<junction x="38.1" y="-22.86"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="XOSC_Q2"/>
<pinref part="Q1" gate="G$1" pin="3"/>
<wire x1="20.32" y1="2.54" x2="45.72" y2="2.54" width="0.1524" layer="91"/>
<wire x1="45.72" y1="2.54" x2="45.72" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="45.72" y1="-22.86" x2="48.26" y2="-22.86" width="0.1524" layer="91"/>
<junction x="45.72" y="-22.86"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="C14" gate="G$1" pin="1"/>
<pinref part="IC1" gate="G$1" pin="DCOUPL"/>
<wire x1="-25.4" y1="35.56" x2="-22.86" y2="35.56" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="35.56" x2="-22.86" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="-96.52" y1="-48.26" x2="-101.6" y2="-48.26" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="-48.26" x2="-101.6" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="-55.88" x2="-22.86" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="JP1" gate="A" pin="9"/>
<wire x1="-96.52" y1="-50.8" x2="-96.52" y2="-60.96" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="-96.52" y1="-43.18" x2="-104.14" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="-43.18" x2="-104.14" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="66.04" x2="-7.62" y2="66.04" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="P2_2"/>
<wire x1="-7.62" y1="66.04" x2="-7.62" y2="30.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P2_1"/>
<wire x1="-10.16" y1="30.48" x2="-10.16" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="63.5" x2="-83.82" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-83.82" y1="63.5" x2="-83.82" y2="-43.18" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="-83.82" y1="-43.18" x2="-88.9" y2="-43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="RESET_N"/>
<wire x1="-12.7" y1="-55.88" x2="-10.16" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="C18" gate="G$1" pin="1"/>
<wire x1="-10.16" y1="-55.88" x2="0" y2="-55.88" width="0.1524" layer="91"/>
<junction x="-10.16" y="-55.88"/>
<wire x1="0" y1="-12.7" x2="0" y2="-55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="Q2" gate="P" pin="1"/>
<pinref part="C20" gate="G$1" pin="2"/>
<wire x1="12.7" y1="60.96" x2="17.78" y2="60.96" width="0.1524" layer="91"/>
<wire x1="12.7" y1="60.96" x2="12.7" y2="63.5" width="0.1524" layer="91"/>
<wire x1="12.7" y1="63.5" x2="-2.54" y2="63.5" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="P2_4/XOSC32K_Q1"/>
<wire x1="-2.54" y1="63.5" x2="-2.54" y2="30.48" width="0.1524" layer="91"/>
<junction x="12.7" y="60.96"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="Q2" gate="P" pin="2"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="22.86" y1="60.96" x2="27.94" y2="60.96" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="P2_3/XOSC32K_Q2"/>
<wire x1="-5.08" y1="30.48" x2="-5.08" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="66.04" x2="27.94" y2="66.04" width="0.1524" layer="91"/>
<wire x1="27.94" y1="66.04" x2="27.94" y2="60.96" width="0.1524" layer="91"/>
<junction x="27.94" y="60.96"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_6"/>
<wire x1="-17.78" y1="30.48" x2="-17.78" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="50.8" x2="-45.72" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="50.8" x2="-50.8" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="50.8" x2="-50.8" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="78.74" x2="-45.72" y2="50.8" width="0.1524" layer="91"/>
<junction x="-45.72" y="50.8"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="-66.04" y1="12.7" x2="-50.8" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="12.7" x2="-66.04" y2="-38.1" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="-38.1" x2="-48.26" y2="-38.1" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="-48.26" y1="-48.26" x2="-48.26" y2="-38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_7"/>
<wire x1="-15.24" y1="30.48" x2="-15.24" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="53.34" x2="-38.1" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="53.34" x2="-53.34" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="53.34" x2="-53.34" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="78.74" x2="-38.1" y2="53.34" width="0.1524" layer="91"/>
<junction x="-38.1" y="53.34"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="-68.58" y1="-40.64" x2="-68.58" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="15.24" x2="-68.58" y2="15.24" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="-68.58" y1="-40.64" x2="-50.8" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="-40.64" x2="-50.8" y2="-48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="C21" gate="G$1" pin="2"/>
<wire x1="-114.3" y1="104.14" x2="-96.52" y2="104.14" width="0.1524" layer="91"/>
<wire x1="-96.52" y1="104.14" x2="-86.36" y2="104.14" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="2"/>
<junction x="-96.52" y="104.14"/>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="-83.82" y1="109.22" x2="-83.82" y2="104.14" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="104.14" x2="-83.82" y2="104.14" width="0.1524" layer="91"/>
<junction x="-83.82" y="104.14"/>
<junction x="-86.36" y="104.14"/>
<pinref part="JP5" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="BATT"/>
<wire x1="-48.26" y1="109.22" x2="-43.18" y2="109.22" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="109.22" x2="-2.54" y2="109.22" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="109.22" x2="20.32" y2="109.22" width="0.1524" layer="91"/>
<wire x1="20.32" y1="109.22" x2="33.02" y2="109.22" width="0.1524" layer="91"/>
<junction x="20.32" y="109.22"/>
<pinref part="C23" gate="G$1" pin="2"/>
<pinref part="U2" gate="G$1" pin="IN"/>
<pinref part="U$1" gate="G$1" pin="3"/>
<wire x1="2.54" y1="93.98" x2="-2.54" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="93.98" x2="-2.54" y2="109.22" width="0.1524" layer="91"/>
<junction x="-2.54" y="109.22"/>
<wire x1="-43.18" y1="109.22" x2="-43.18" y2="124.46" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="2"/>
<wire x1="-43.18" y1="124.46" x2="-33.02" y2="124.46" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="124.46" x2="-33.02" y2="121.92" width="0.1524" layer="91"/>
<junction x="-43.18" y="109.22"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P2_0"/>
<wire x1="-12.7" y1="30.48" x2="-12.7" y2="55.88" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="55.88" x2="-55.88" y2="55.88" width="0.1524" layer="91"/>
<wire x1="-55.88" y1="55.88" x2="-55.88" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-55.88" y1="17.78" x2="-71.12" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-71.12" y1="-43.18" x2="-71.12" y2="17.78" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="-45.72" y1="-48.26" x2="-45.72" y2="-43.18" width="0.1524" layer="91"/>
<wire x1="-45.72" y1="-43.18" x2="-71.12" y2="-43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="2"/>
<wire x1="-12.7" y1="96.52" x2="2.54" y2="96.52" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="-12.7" y1="88.9" x2="-12.7" y2="96.52" width="0.1524" layer="91"/>
<junction x="-12.7" y="96.52"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="ISET"/>
<wire x1="-48.26" y1="99.06" x2="-30.48" y2="99.06" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="99.06" x2="-30.48" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="TS"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="-48.26" y1="104.14" x2="-22.86" y2="104.14" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="104.14" x2="-22.86" y2="96.52" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="-22.86" y1="96.52" x2="-22.86" y2="88.9" width="0.1524" layer="91"/>
<junction x="-22.86" y="96.52"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="STAT1"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="-48.26" y1="93.98" x2="-38.1" y2="93.98" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="93.98" x2="-38.1" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="STAT2"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="-48.26" y1="88.9" x2="-45.72" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_0"/>
<wire x1="-2.54" y1="-12.7" x2="-2.54" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="8"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_1"/>
<wire x1="-5.08" y1="-12.7" x2="-5.08" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="7"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_4"/>
<wire x1="-12.7" y1="-12.7" x2="-12.7" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="4"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_6"/>
<wire x1="-17.78" y1="-12.7" x2="-17.78" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="2"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_0"/>
<wire x1="-22.86" y1="-12.7" x2="-22.86" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="-48.26" x2="-30.48" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-30.48" y1="-30.48" x2="-22.86" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="9"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_1"/>
<wire x1="-43.18" y1="0" x2="-53.34" y2="0" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="0" x2="-53.34" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="-25.4" x2="-33.02" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="-25.4" x2="-33.02" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="8"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_3"/>
<wire x1="-43.18" y1="5.08" x2="-58.42" y2="5.08" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="5.08" x2="-58.42" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="-48.26" x2="-38.1" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="-30.48" x2="-58.42" y2="-30.48" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="6"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_2"/>
<wire x1="-43.18" y1="2.54" x2="-55.88" y2="2.54" width="0.1524" layer="91"/>
<wire x1="-55.88" y1="2.54" x2="-55.88" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="-48.26" x2="-35.56" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="-27.94" x2="-55.88" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="7"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="-60.96" y1="-33.02" x2="-60.96" y2="7.62" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="P1_4"/>
<wire x1="-60.96" y1="7.62" x2="-43.18" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-60.96" y1="-33.02" x2="-40.64" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="-33.02" x2="-40.64" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="5"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P1_5"/>
<wire x1="-43.18" y1="10.16" x2="-63.5" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="10.16" x2="-63.5" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="-35.56" x2="-43.18" y2="-35.56" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="-35.56" x2="-43.18" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="4"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_2"/>
<wire x1="-7.62" y1="-12.7" x2="-7.62" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="6"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_3"/>
<wire x1="-10.16" y1="-12.7" x2="-10.16" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="5"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_5"/>
<wire x1="-15.24" y1="-12.7" x2="-15.24" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="3"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="P0_7"/>
<wire x1="-20.32" y1="-12.7" x2="-20.32" y2="-48.26" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="1"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="USB_PWR"/>
<pinref part="U1" gate="G$1" pin="USB_SEL"/>
<wire x1="-73.66" y1="99.06" x2="-73.66" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R10" gate="G$1" pin="2"/>
<junction x="-73.66" y="104.14"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CHG_IN"/>
<pinref part="R11" gate="G$1" pin="2"/>
</segment>
</net>
<net name="CONNECTOR_MOUNT" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="S1"/>
<wire x1="2.54" y1="101.6" x2="0" y2="101.6" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="S2"/>
<wire x1="2.54" y1="91.44" x2="0" y2="91.44" width="0.1524" layer="91"/>
<wire x1="0" y1="91.44" x2="0" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="L3" gate="G$1" pin="2"/>
<pinref part="L4" gate="G$1" pin="1"/>
<wire x1="104.14" y1="10.16" x2="106.68" y2="10.16" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="109.22" y1="10.16" x2="106.68" y2="10.16" width="0.1524" layer="91"/>
<wire x1="106.68" y1="10.16" x2="106.68" y2="7.62" width="0.1524" layer="91"/>
<junction x="106.68" y="10.16"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="L4" gate="G$1" pin="2"/>
<wire x1="124.46" y1="10.16" x2="127" y2="10.16" width="0.1524" layer="91"/>
<wire x1="127" y1="10.16" x2="127" y2="27.94" width="0.1524" layer="91"/>
<pinref part="A1" gate="G$1" pin="FEED"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
