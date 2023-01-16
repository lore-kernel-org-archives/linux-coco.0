Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40876FA5
	for <linux-coco@lists.linux.dev>; Mon, 16 Jan 2023 16:59:29 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30GFDaME025794;
	Mon, 16 Jan 2023 16:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=MmyxBa64z+xhLxkgyhfxOt+W6ycc6dcLBZupbvNLlg8=;
 b=LL7ZhQzNnrOJJ9sMKnx/itginGwdwDDDlfxKzZ2S0ixEUXuS0mbjhE04Lp+sMss7aKXp
 k0ElDv0pyXfekccr68nszKUjUAvgNM1FLj2+19CZYwEAjy0+f7dqLGM/HzrK8oHakY1q
 QiFgNgckQmX19Png7GCWcGJru2xuTcz1HQ5Mh/hKDG6jrMjizKALf4SI28bvf1cfgPzb
 tRvJA49r3i5lcI96xLtkDmFw/Qf6n/XEG1GfCKev/clwpt+tjvbcQsNR2RObn7mPTunP
 nRZnW/l4eXJMNbV8Y10G4b8p0ZieOXErCvfXTC3ec8FMMz2KhywqC2PLYCyWWE9x2A3Y Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n58x1th7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 16:59:21 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30GGoA1O000844;
	Mon, 16 Jan 2023 16:59:21 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n58x1th6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 16:59:21 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30GFnNdU013855;
	Mon, 16 Jan 2023 16:59:20 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n3m16s5vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 16:59:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30GGxJdZ8192736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 16:59:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 190A47805C;
	Mon, 16 Jan 2023 18:40:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44A697805E;
	Mon, 16 Jan 2023 18:40:42 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Mon, 16 Jan 2023 18:40:41 +0000 (GMT)
Message-ID: <c9138bd720f94f74bf8af1d305d79857a70ef765.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Mon, 16 Jan 2023 11:59:17 -0500
In-Reply-To: <Y8WBmNVD8DuRQuC2@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <Y8Gi0KLj5JbhCqBE@redhat.com> <Y8Lhd/H4yGTsOM/+@suse.de>
	 <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>
	 <Y8WBmNVD8DuRQuC2@suse.de>
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
X-Proofpoint-GUID: W698RP3tCvfhM20zbmID_OxXOyHKf5yP
X-Proofpoint-ORIG-GUID: Gs3o0T4PFvKBgHxPxxbvHdg40jW_cgQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_14,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=798 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160123

On Mon, 2023-01-16 at 17:55 +0100, Jörg Rödel wrote:
> On Sat, Jan 14, 2023 at 01:22:41PM -0500, James Bottomley wrote:
> > On Sat, 2023-01-14 at 18:08 +0100, Jörg Rödel wrote:
> > 
> > [...]
> > > As James also said, the measurement to unlock secrets need to
> > > include all software/data components up to the point where the
> > > encrypted disk gets mounted.
> > 
> > Well, we have a prototype in IBM Research using keylime to do this
> > based on the vTPM measurements.  We currently bring up a network
> > interface inside the initrd to run the keylime agent, but if you're
> > already inventing a non-network method for attestation, there's no
> > reason we couldn't transport TPM quotes over it as well.
> 
> So you are unlocking the disk via keylime remote attestation. This
> means you need a measured initrd, right?

Right, the current measured boot for a standard machine includes a
measurement of the initrd.

> We were thinking about doing disk-unlocking via TPM in Grub, but that
> has the problem that we need to securely deploy the TPM state at SVSM
> init-time.

Not necessarily.  We're prototyping it with an intermediate parent key
which can be injected after measurement using the keylime facility.

James

