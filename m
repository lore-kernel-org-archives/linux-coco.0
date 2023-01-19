Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878623D6E
	for <linux-coco@lists.linux.dev>; Thu, 19 Jan 2023 21:29:30 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JL99Uw026984;
	Thu, 19 Jan 2023 21:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=5zt012LmkqANqULsgIh7vBngyXKimArtQBucQ4BaqQk=;
 b=dSltYPthzlM32x+RYU+gIA27H7n2Ql2in7nlrUKAuvg0ox9OLPtzmfTl5GqAStLR+UqG
 EWqDRnXmEYuz3nHstu/VZLKfTG+PpRwlDH872Vx1RrNmY5+F+X76EBfsXFgEisyk+sXK
 JvLLnuWOeWX8eGL3BdewZl8TARZgvhRP20A5EHFFAVL5NvlKBPjIftJS++lOnk9LBCb+
 Siv/t0EQnrZe1yLfns3SqigX5bFFY3qRtiwPDO5ZooXb/Z6M7s87qMZy/iZIfKpP+mmj
 hol5BnNHN7KO3Qr0O4cRlMyltixCAW0vvzHG9uAA/ztA9Z5x4+WGVmx6DmwivdX6ocBp 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7d248x63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:29:29 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JLCDNi008160;
	Thu, 19 Jan 2023 21:29:28 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7d248x5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:29:28 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJZBx7020220;
	Thu, 19 Jan 2023 21:29:27 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3n3m1803n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 21:29:27 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JLTQ8a40305394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 21:29:26 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C21B37805E;
	Thu, 19 Jan 2023 23:13:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBF557805C;
	Thu, 19 Jan 2023 23:13:01 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 19 Jan 2023 23:13:01 +0000 (GMT)
Message-ID: <ad022a0c7cbe2b77da830e1bc0864d7841aab375.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
        "\"Daniel P." =?ISO-8859-1?Q?Berrang=E9=22?= <berrange@redhat.com>,
        linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Thu, 19 Jan 2023 16:29:23 -0500
In-Reply-To: <Y8mztTGpZbWi89sn@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
	 <17039966-2D3C-47F1-A5C3-82302CBD8D9D@redhat.com>
	 <f86f8d6844f1166a6c641df3fa437cad59bcee9a.camel@linux.ibm.com>
	 <Y8mztTGpZbWi89sn@suse.de>
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
X-Proofpoint-ORIG-GUID: Pxfvb1AEJO4U-FLDi7GF5oK3v7_6TSoq
X-Proofpoint-GUID: rBGar_d_OKgm5N-Xzr3sOaGpFoF1jdNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=907
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190176

On Thu, 2023-01-19 at 22:18 +0100, Jörg Rödel wrote:
> On Thu, Jan 19, 2023 at 09:10:48AM -0500, James Bottomley wrote:
> > Yes, you have to think about this.  Possessing the secrets is the
> > problem if you don't trust what you've mounted, so in the original
> > prototype the secrets got destroyed if they weren't used (as in you
> > couldn't crypto mount the disk), so you can fallback to a
> > potentially untrusted disk if you can ensure the secrets can't be
> > leaked.  I suppose secret destruction and fallback should be a
> > configurable policy of the system instead of hard coded as I did in
> > the initial prototype.
> 
> Is this still an issue in the SVSM version of this? The secrets will
> stay in SVSM memory at VMPL0 and the higher VMPLs will not be able to
> access them until they proved that only trusted software was loaded.

How can they stay there?  Even if the SVSM is the point of first
contact to receive the secret, it must give the secret to higher VMPLs
to try the mount, so the higher VMPLs have to destroy the secret they
were given on failure.

James

