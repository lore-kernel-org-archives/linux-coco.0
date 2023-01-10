Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544F5B441
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 23:53:08 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30ALE6Pn022347;
	Tue, 10 Jan 2023 23:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=csNud32ErZQvQunL83KLHvGL6l8WB04+JM2PlHwPc8E=;
 b=QCINjAIZqIQVCdfypaVmtmAeZsjhdtuy8RoBQ959/92I6x09EhOGllTQoPnBOKwdVu2p
 EzP5OHftIbeHTgeNW3Q7GUCugrU0cH18mnEGc8Aj0QBzhtUaoD4/qj5YADDiKcU3KRvZ
 OwiDEFTsJLjpvkIPNzxN9zpfWRme+adPPNbaQQNqVceRTAaS/jNR0ySHV8RqGXmY0T+c
 VR4VKQOW81GYxaC9Zi3XEX91YMOQFuU4uXxqm980wZfEJrglNy+bwN3A2teDXEmFArxE
 jhOF/x934miotL0PL4DHrOPS+ARIOVRVfr9NG3zxr9vf0AdGtcyjyl2MYABmAQJFSL4u zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1frgaxdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 23:53:01 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30ANjnxh007016;
	Tue, 10 Jan 2023 23:53:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1frgaxdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 23:53:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ANFcu2007514;
	Tue, 10 Jan 2023 23:52:59 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3my0c7sn6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 23:52:59 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30ANqvVZ58327424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 23:52:58 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C4F67805F;
	Wed, 11 Jan 2023 01:30:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51C0D7805C;
	Wed, 11 Jan 2023 01:30:21 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 11 Jan 2023 01:30:20 +0000 (GMT)
Message-ID: <851632f85278dad75a5bdc944cbe616a86ae4e18.camel@linux.ibm.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Tom Lendacky <thomas.lendacky@amd.com>,
        Dionna Amalie Glaze
	 <dionnaglaze@google.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
	 <amd-sev-snp@lists.suse.com>
Date: Tue, 10 Jan 2023 18:52:55 -0500
In-Reply-To: <09079dc6-e0b0-85d8-34df-575e576e6c47@amd.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
	 <804079b5-c090-af4b-ecca-839ab8bea0f7@amd.com>
	 <82e9126149127c11a09bf031125edf2ee72a7a26.camel@linux.ibm.com>
	 <09079dc6-e0b0-85d8-34df-575e576e6c47@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZiI4damdidJlddofRbVI-5d5qLnkGDIt
X-Proofpoint-GUID: st4YaEs8ieHQrwso2iFdlrqE7YdDQRj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_09,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 mlxlogscore=724 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100158

On Tue, 2023-01-10 at 16:45 -0600, Tom Lendacky wrote:
> On 1/10/23 16:14, James Bottomley wrote:
[...]
> > consumers can access all localities without restriction locality
> > becomes a totally useless thing.  To give a meaning to locality,
> > you have to have some restrictions about how components can access
> > it. The only current user of localities I know is dynamic launch
> > and that's usually done by restricting locality 4 to the CPU
> > microcode in a physical system.
> > 
> > Until we can agree what dynamic launch (or some other locality
> > consumer) might mean in a confidential VM (and that the SVSM can
> > police it) there's no real point wiring locality up in the linux
> > kernel driver.  I mean the linux kernel itself doesn't use
> > localities either, it just sets them to 0 unless the TPM indicates
> > a different default value.
> > 
> > If we do find a use for localites, whatever we use them for would
> > be described by TPM event log entries, so there would be no need of
> > a new versioned SVSM call.
> 
> I think there would be, though. Right now the call says any non-zero 
> locality value returns an error because, as you alluded, there is no 
> policing by the SVSM. The API suddenly starting to support non-zero 
> localities breaks the API, no?

Right, but that makes it a doctor it hurts problem.  Just because we
currently don't know how we'd police locality in the SVSM doesn't mean
an OS upward of us can't.  For instance the current argument about
hibernate keys could be solved by making the linux kernel access the
TPM at a different locality from the one it exposes to user space, so
creation data would definitively tell us if the kernel or a user
created a given TPM key.  Hmm, perhaps I should wire up locality in the
driver ... so the kernel can set it, then we won't fail unexpectedly if
a kernel use case actually comes along. 

James

