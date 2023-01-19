Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130237471
	for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 14:10:56 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JDusHX021569;
	Thu, 19 Jan 2023 14:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=czAEDvQbzhgaRFvBsmtPn2ET/t6JNngJzD8dsMr/hzo=;
 b=BWaSvAB6djCTSzUUt1bxY5Lgm1hunEjycaOVFcR/fOQgJKMiXmmoqID3WiHVde6UAaeg
 1eynjEgUnw07kpIRnTIrL+6Y4W91wT7AfekbWfJh99/2ZXQM8g4RgAYzfsGYeP4ujJHe
 u+I4beqJaRBKFilFEKd/wQjELsdtCOlkhcwTaRvi3zvPAj0hBEkaGalT3VUHe8xXBltV
 5vT/zgDeaKUNFafTbRUD8pqDM94ZEgS/6TBvEGoi0uoRUvtELQ8CrR4jeqpsHxw0/JgU
 vU+VD37QMQM7HyYuaPYAQ1VFrBGUgqRwDGVfSFpBX5Jgd+lwTjeti+ckUFdk2dozTjG2 +w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n776e8fr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 14:10:53 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JDwJsa029805;
	Thu, 19 Jan 2023 14:10:53 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n776e8fqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 14:10:53 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JCoLQa018747;
	Thu, 19 Jan 2023 14:10:52 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3n3m17mh3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 14:10:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JEAp5A29032710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 14:10:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F7597805F;
	Thu, 19 Jan 2023 15:54:15 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 214297805E;
	Thu, 19 Jan 2023 15:54:14 +0000 (GMT)
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 19 Jan 2023 15:54:13 +0000 (GMT)
Message-ID: <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
Cc: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
        "\"Daniel P."
 =?ISO-8859-1?Q?Berrang=E9=22?= <berrange@redhat.com>,
        linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Thu, 19 Jan 2023 09:10:48 -0500
In-Reply-To: <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
	 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
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
X-Proofpoint-GUID: bDZANMbZiQVvpZGWJsZMqFKO3q3Eril5
X-Proofpoint-ORIG-GUID: 5UM1kFSumM9IHU7kJJn7RT_R8HyJz1YU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_09,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190113

On Thu, 2023-01-19 at 15:05 +0100, Christophe de Dinechin Dupont de
Dinechin wrote:
> 
> 
> > On 13 Jan 2023, at 19:02, James Bottomley <jejb@linux.ibm.com>
> > wrote:
> > 
> > On Fri, 2023-01-13 at 18:22 +0100, Jörg Rödel wrote:
> > [...]
> > >         2. Host owner attaches a different disk image with
> > > malicious content, e.g. a boot loader that sends the secrets to
> > > the host owner.
> > 
> > 
> > This attack was discussed in the initial encrypted image prototype
> > for SEV and SEV-ES.  The idea is that either the disk is encrypted
> > with the injected encryption key (i.e. decodes correctly) or it
> > isn't, in which case it's up to the mounting component (grub in the
> > initial prototype and initrd in this proposal) to declare failure
> > and destroy the secrets.
> 
> However, I recall discussions about the possibility that the host
> owner could trigger a fallback back that mounts an *unencrypted*
> disk successfully (or even discovers it). I remember discussions
> on such cases with Daniel (about auto-discovery of boot partitions)
> and Gerd (about fallback path for “compatibility” reasons).
> 
> So I believe that we need to clarify how we prevent the discovery
> and mounting of non-encrypted partitions, no?

Yes, you have to think about this.  Possessing the secrets is the
problem if you don't trust what you've mounted, so in the original
prototype the secrets got destroyed if they weren't used (as in you
couldn't crypto mount the disk), so you can fallback to a potentially
untrusted disk if you can ensure the secrets can't be leaked.  I
suppose secret destruction and fallback should be a configurable policy
of the system instead of hard coded as I did in the initial prototype.

James

