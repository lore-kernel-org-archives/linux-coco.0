Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118A20FE
	for <linux-coco@lists.linux.dev>; Fri, 20 Jan 2023 12:39:36 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KBlXvj024893;
	Fri, 20 Jan 2023 12:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=IfbWCZDiEKX1twXdqm95ElIUHYI9dRe5a/MF90NGuEU=;
 b=LXvuRds4IrofVgjpbScKLFoM4iTQMGokill6utPsfZhGElqF8N29aopENEnhxQiX71rc
 P3iy/z8KVKIohVbl2cwqw4eNVjMKTmbDi4GC3ybnfnm41vXLXA2rlRs12RdKLfh+O5rO
 dnbyc173HPQGCbZS9PRi1zd8AVu7HVc5RXdwXwdOnFCcC915wn46VkpnqXUxtTVb0dwo
 o4t+c3h8R1oR4j1Ooj4HT2qDSiJLOAWhEtKGt/SVOyczsw3BBoCa6Li3Sg71HTxLoHUt
 0IUEZm7yFE9MocmOp3gWOlKXqVoHypTaLufpbSj3GIuNI5Vl1RxPUP9gwFW4Ofbf1wuu Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7td497ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:39:35 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KBlY7l024986;
	Fri, 20 Jan 2023 12:39:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7td497pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:39:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30KA4OE9019293;
	Fri, 20 Jan 2023 12:39:34 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3n3m184kuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:39:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30KCdXJ41770118
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 12:39:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 446067805E;
	Fri, 20 Jan 2023 14:23:36 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C667805C;
	Fri, 20 Jan 2023 14:23:35 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 14:23:34 +0000 (GMT)
Message-ID: <4086b1c3fc3f68b0dd0b0b9acf0c22256022efa1.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
        =?ISO-8859-1?Q?J=F6rg_R=F6del?=
	 <jroedel@suse.de>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
        linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Fri, 20 Jan 2023 07:39:30 -0500
In-Reply-To: <Y8pXeZHY+bKQDen2@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
	 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
	 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
	 <Y8mztTGpZbWi89sn@suse.de>
	 <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
	 <Y8pSzx1g8THT3rnC@suse.de> <Y8pXeZHY+bKQDen2@redhat.com>
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
X-Proofpoint-ORIG-GUID: o9sleT4Fs-7zcwLxYwTPXD2RTDD3VAu6
X-Proofpoint-GUID: g6u6Ksw52qIrn6GFamrJn67Px-IQVrmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_07,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200115

On Fri, 2023-01-20 at 08:57 +0000, Daniel P. Berrangé wrote:
> On Fri, Jan 20, 2023 at 09:37:35AM +0100, Jörg Rödel wrote:
> > On Thu, Jan 19, 2023 at 04:29:23PM -0500, James Bottomley wrote:
> > > How can they stay there?  Even if the SVSM is the point of first
> > > contact to receive the secret, it must give the secret to higher
> > > VMPLs
> > > to try the mount, so the higher VMPLs have to destroy the secret
> > > they
> > > were given on failure.
> > 
> > My thinking was that the SVSM will only hand out the secrets once
> > the
> > code in higher VMPLs has proven itself to be trusted. But it is
> > possible
> > for an attacker to create an image with the expected parts to get
> > the
> > measurements right and then use a fall-back mount if decryption
> > fails to
> > steal the secret.
> 
> With a vTPM, and systemd-pcrphase.service, it is possible to seal
> secrets to prevent such an attack, by including phase=initrd in
> the sealing PCRs. IOW, nothing after the initrd can unseal the
> secrets, even if a different filesystem mount was substituted.
> 
> Secrets that are needed /after/ the root FS is mounted (eg SSH
> host key, Apache HTTP certs) can be sealed with a PCR set that
> covers the LUKS master key hash, so that they can only be acccessed
> if the correct rootfs was unlocked.

But that provides no additional security: the LUKS master hash is just
a hash of an area on the disk which anyone controlling the device can
see.  I can duplicate this area and still substitute my own volume
(which would still fail to decrypt when presented with the key), so the
trusted mounting component sill has to correctly handle the failure
case.

> In the vTPM case, the guest owner is deciding policy when they
> seal secrets to the vTPM during guest provisioning initially.
> If we try to support a scenario without a vTPM, then the guest
> owner has to determine policy by using a carefully built initrd
> that does not do any fallbacks, and they have to rely on having
> a known firmware with a particular set to certs enrolled, which
> has support implications for public clouds. Much less flexible.
>  
> > But such mount fallbacks a generally a bad idea in a CVM.
> 
> Yep, but hopefully not fatal, if the user picks a suitable set
> of PCRs for sealing data.

You can't rely only on PCRs for this because they don't contain enough
information, you must code the correct policy into the trusted mount
component as well.

James

