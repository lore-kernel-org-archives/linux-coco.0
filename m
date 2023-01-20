Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B420FE
	for <linux-coco@lists.linux.dev>; Fri, 20 Jan 2023 12:37:42 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KCMeZL018873;
	Fri, 20 Jan 2023 12:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=ChdiCEknj2ImMiqBPRsPE+gjLHrO1LAYd+mFXJKRnnA=;
 b=X2hHOf/ywkd+3+gj8hjiqA34C3asXCv4NTY+uqwxTNw4NlwW+gkX5ltZ2dDqyTFp8fhV
 sBmoIMru5prU41gDjdl4ntnN5w6UosFyF2hSnskispz2aTwBEdPJupxM5JsC4qPyk6l2
 wQ1SPWadnFJLPu+N7sz1J3uTEjuQ3XBPii9JNbm40y94RIO160Tn0NSY6cYnbTEDEfL0
 oMig0mnMXOz8IH2DWIvRnDlOfC/NRjFf2Kbf3snZGJzq2WANQBRrh5OkiTWVNhQQDkfj
 zSA5bxnRJBmqks3VCJ3qwk4G5C01JoL2GEXpvUY0088FEzpXss4EU499NY52rFT/OWMr Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7twkg9j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:37:35 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KCS8a7038642;
	Fri, 20 Jan 2023 12:37:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7twkg9hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:37:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30KA57s2025489;
	Fri, 20 Jan 2023 12:32:34 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n3m18cm3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:32:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30KCWWiY42271408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 12:32:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D620A7805E;
	Fri, 20 Jan 2023 14:16:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECC797805C;
	Fri, 20 Jan 2023 14:16:34 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 14:16:34 +0000 (GMT)
Message-ID: <2f80eb786c91b9fb830eabf0edfd6873931ac9fb.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
        "\"Daniel P." =?ISO-8859-1?Q?Berrang=E9=22?= <berrange@redhat.com>,
        linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Fri, 20 Jan 2023 07:32:30 -0500
In-Reply-To: <Y8pSzx1g8THT3rnC@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
	 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
	 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
	 <Y8mztTGpZbWi89sn@suse.de>
	 <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
	 <Y8pSzx1g8THT3rnC@suse.de>
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
X-Proofpoint-ORIG-GUID: ez6gkGAAYKGH1HGuWKoMcTCdIq5egI-F
X-Proofpoint-GUID: 5h0mxAm3abLmyrqvdw0YxTiyTHUkTLh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_07,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301200115

On Fri, 2023-01-20 at 09:37 +0100, Jörg Rödel wrote:
> On Thu, Jan 19, 2023 at 04:29:23PM -0500, James Bottomley wrote:
> > How can they stay there?  Even if the SVSM is the point of first
> > contact to receive the secret, it must give the secret to higher
> > VMPLs to try the mount, so the higher VMPLs have to destroy the
> > secret they were given on failure.
> 
> My thinking was that the SVSM will only hand out the secrets once the
> code in higher VMPLs has proven itself to be trusted.

Yes, that's quite correct, but not inconsistent with the need to pass
secrets up before you know there's a problem.

The posited situation is that the trusted initrd/OS needs to mount a
cloud supplied encrypted disk.  There's no assessment the SVSM can make
of that *before* the mount is actually tried, so the SVSM has to
release the secrets based on the fact that the measured initrd/OS is
trusted to execute the correct policy on mount failure. i.e. destroy
the secrets.

>  But it is possible for an attacker to create an image with the
> expected parts to get the measurements right and then use a fall-back
> mount if decryption fails to steal the secret.

No, that's the principle of chain of trust.  The attacker can't insert
the bad component to replace any of the measured parts, so if you
measure the part that uses the secret and you trust it to handle the
secret correctly there's no substitution attack which can exfiltrate
it.

> But such mount fallbacks a generally a bad idea in a CVM.

I won't dispute that, but even if you don't fallback, for security's
sake you still have to destroy the secret ASAP because the longer you
run with it the wider the window of exposure to an exploit attack in a
measured component.

James

