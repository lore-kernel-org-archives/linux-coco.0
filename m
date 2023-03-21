Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F788C04
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 11:09:47 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32LAtbl3016779;
	Tue, 21 Mar 2023 11:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IcVTfatXtXzF7BUgM+gClS/t5xUYcK0H+MNzBoUuoeA=;
 b=ICEzFJCy9q051u9RljELUVjXAIYOZWInfm69iO1xZDondq2SJ/k6Wv4m1foo1zLruE5X
 b/M0ta01huRixze1cJfP3r2btRcNLLfKj2XOhKOPnDaG1ZEkDAynGmxK4FRjvcuMQxtp
 ZDcynoqsxaM/zc3LHhOjLoqOG79GIIGOc/3RhBZ3vJN5jVOUg0bF9cPKfoQ0+rFIlVoA
 HjyHrakc4qUurrm19OjRMwQGdMNii0Iq72HPUuAhgJEPup6Ru14GTF7Shu+byarmibpG
 CGNdbWnaX/9HnHGb8VPuddPAykQCu2ctXXCswyjW0+o9FOk2q4GZZfUtUies2hqj9QzY zA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfb8q8aet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 11:09:46 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32LA9lDY025936;
	Tue, 21 Mar 2023 11:09:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7enev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 11:09:45 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32LB9i1M13435596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Mar 2023 11:09:44 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B8445807B;
	Tue, 21 Mar 2023 11:09:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3201A58057;
	Tue, 21 Mar 2023 11:09:42 +0000 (GMT)
Received: from [172.20.3.173] (unknown [9.163.23.201])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Mar 2023 11:09:42 +0000 (GMT)
Message-ID: <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
        amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
        kvm@vger.kernel.org
Date: Tue, 21 Mar 2023 07:09:40 -0400
In-Reply-To: <ZBl4592947wC7WKI@suse.de>
References: <ZBl4592947wC7WKI@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dok7lrnLE278hAVKT4pUWOr4ZCcZwI71
X-Proofpoint-ORIG-GUID: dok7lrnLE278hAVKT4pUWOr4ZCcZwI71
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_08,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210078

On Tue, 2023-03-21 at 10:29 +0100, Jörg Rödel wrote:
> Hi,
> 
> We are happy to announce that last week our secure VM service module
> (SVSM) went public on GitHub for everyone to try it out and
> participate in its further development. It is dual-licensed under the
> MIT and APACHE-2.0 licenses.
> 
> The project is written in Rust and can be cloned from:
> 
>         https://github.com/coconut-svsm/svsm
> 
> There are also repositories in the github project with the Linux host
> and guest, EDK2 and QEMU changes needed to run the SVSM and boot up a
> full Linux guest.
> 
> The SVSM repository contains an installation guide in the INSTALL.md
> file and contributor hints in CONTRIBUTING.md.
> 
> A blog entry with more details is here:
> 
>         
> https://www.suse.com/c/suse-open-sources-secure-vm-service-module-
> for-confidential-computing/
> 
> We also thank AMD for implementing and providing the necessary
> changes to Linux and EDK2 to make an SVSM possible.

Since this a fork of the AMD svsm code
(https://github.com/AMDESE/linux-svsm/), is it intended to be a
permanent fork, or are you going to be submitting your additions back
upstream like we're trying to do for our initial vTPM prototype?  From
the community point of view, having two different SVSM code bases and
having to choose which one to develop against is going to be very
confusing ...

James



