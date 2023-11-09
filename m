Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE54374EF
	for <linux-coco@lists.linux.dev>; Thu,  9 Nov 2023 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gpkoSabP"
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A9LJMOC004572;
	Thu, 9 Nov 2023 21:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+HYZ05OB3hOlKtu2k0E+W1bvUcu2LyFq9tbUqL+Bwo8=;
 b=gpkoSabPB5SgqLavbPQ4qcx60TFUpBclEkixE3OFM4D6ox0B31lTalGosqzFknebUYRm
 MRJ2QYTjeh3dfoRfY3Q2YIl+s1CzwTZBBImspmo6/j3n30v3X64yW3Yg83tf5JtRAQF2
 MS1ae0M9S70IUUXZ6YCDRBNH4h+Qtgrkid7nvATHaHuegwsCiK8H71ZVyjhptLSOw8Xd
 y6XonIi2MdU1AfEj2rDVsAdi5ILv4/cS+wipzReY3zsAcQ9TBu8UajdAAA5PZIZRYymb
 XEIlAO3N4R0Q5VV4DDjJlph0kfcCJvMdqjzffOaqcehTgfrczmQsLkhPYTxXdnd80kXQ 6g== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u96hg9102-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 21:22:53 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3A9JHu6T000675;
	Thu, 9 Nov 2023 21:22:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u7w236mm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 21:22:52 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3A9LMqql13959886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Nov 2023 21:22:52 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB07658059;
	Thu,  9 Nov 2023 21:22:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DA3258057;
	Thu,  9 Nov 2023 21:22:51 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.67.108.147])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Nov 2023 21:22:50 +0000 (GMT)
Message-ID: <69d8f7d930eb6e40db10f985ffba99a1eaeac32b.camel@linux.ibm.com>
Subject: Re: RFC: CCC Linux Kernel SIG
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Dan Middleton <dan.middleton@linux.intel.com>,
        Carlos Bilbao
	 <carlos.bilbao@amd.com>, linux-coco@lists.linux.dev
Date: Thu, 09 Nov 2023 16:22:49 -0500
In-Reply-To: <0743a815-e567-4273-8e13-bf8372c7ee71@linux.intel.com>
References: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
	 <22966e1b-dd7f-4eb2-ac5d-5988cc6687b6@amd.com>
	 <0743a815-e567-4273-8e13-bf8372c7ee71@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AtgBOnvAOYw62KpMYeAXr0TuLOdDEbR6
X-Proofpoint-ORIG-GUID: AtgBOnvAOYw62KpMYeAXr0TuLOdDEbR6
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_14,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090153

On Thu, 2023-11-09 at 15:05 -0600, Dan Middleton wrote:
> On 11/9/23 11:22 AM, Carlos Bilbao wrote:
> 
> > On 11/7/23 19:24, Dan Middleton wrote:
> > > <snip>
> > > In addition to video meetings, the community will use an existing
> > > Discord channel for ongoing
> > > communication. No mail list is required at this time.
> > 
> > May I ask what Discord channel you're referring to? I'm assuming
> > it's
> > open access.
> > 
> https://discord.com/channels/1123803528377413762/1124090655707234334
> 
> I believe it is open.
> All CCC community forums zoom, slack, mail list, code are open.
> However, this is a pre-existing channel... see below.
> 
> On 11/9/23 12:38 PM, James Bottomley wrote:
> > Just on a personal note: I've had no end of trouble with Discord,
> > primarily around the verification requirements for my email address
> > preventing me from getting an account from the single gatekeeper,
> > so it
> > would be last on my list of useful systems for open conversations.
> 
> The CCC typically uses slack.

For slack like but open chat, most communities are coalescing around
matrix (it's what Linux Plumbers will be using).  The kernel community
does still like IRC, though.


> This discord reference is meant to accommodate kernel contributors
> who are already communicating there.

OK, I'm not actually aware of any kernel conversations going on in
Discord (but then the kernel is a huge community, so I'm not aware of a
lot of things ...).
 
>  We don't want to break anything that's working.
> Instead looking to bridge these different parts of the confidential 
> computing community who aren't in communication right now.

As I said in my reply: I'd start on the existing Mailing lists. 
Designate someone at the CCC to watch and report and then relay any
feedback or concerns.  At least that starts to get you input without
having to have everyone in the CCC exposed to the kernel community.

James

