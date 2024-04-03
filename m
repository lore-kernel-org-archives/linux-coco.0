Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235063DB9B
	for <linux-coco@lists.linux.dev>; Wed,  3 Apr 2024 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712146739; cv=none; b=r6uiW2LcrDiMV5IhEEx/gdIz7CRSRxxExgRtfBR70CteOXlKGpTE/GhLUGwR1bnsRFw+PyTl3MjKNAFrcKU3958f/UrJfbQHr9nHuzgMyajhV0T6ruF3i1PZNLRiYRFdIH3gTMn7jt/eqERc5zfOoViTXhYtZi4KgSrkvjtZsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712146739; c=relaxed/simple;
	bh=SjZXE9vdy2lq6EiVjNqzRjrDCqEuXkGUrtDZnNmiBjM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JoIIFsKHqdYGC3Qx0OebKA0zf75PuHp4oq9vOaDG9ABTKn+gbbH8nT7Gugg2zJ3Qng6tEFLGpB9Rc3tejPlmjKYshxc0mdKLK3J3h4du7afrkLDF7sTAc+Z+6LDiyvLHr/4FfvgVAXc2tO1LpcNkDVvwZ23+GcwORWKU0gKkLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FFdeWL9k; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FFdeWL9k"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 433BWhfn006642;
	Wed, 3 Apr 2024 12:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Z8bZG1R++6NentQ1IocUMD15JpigmH7esz2Bdn+cJG4=;
 b=FFdeWL9kp2HZD1FKdM7dhaL145SZfC6q1Az9zApLJEoXAiLJ5wlFNqdSio8fnHcBNfs4
 oalJwcGF/YAYj73wcED/GHdwJ/TAwEXhNnnEzjLfyl/VxIScsg7PbqZ9Rq5V1rPlsPWE
 +cpINv/VxZGQPJ2+1a1ahD9s2lRoG1RB+qB/Pi63vS0NMnk+yA/7vIXfvEo+u80a3JUF
 QG6DAzA5CYLpzO7C6hKNDWHPU68xCmE2ZQTO2PLLFvUrLz5mX2Uy/QbG1veqU9+LfN65
 ODbRoBWmCYEimusEuhQOlZFVItghFgEk/xFGg/7KTdb1psl4P9TufvnZ0fwIsbEjVHxV 0A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x96at8332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 12:18:52 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 433BBLus008457;
	Wed, 3 Apr 2024 12:18:52 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x6w2u5f1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 12:18:52 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 433CInap26018432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Apr 2024 12:18:51 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13C2658062;
	Wed,  3 Apr 2024 12:18:49 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 044A25805F;
	Wed,  3 Apr 2024 12:18:48 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.67.11.144])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Apr 2024 12:18:47 +0000 (GMT)
Message-ID: <74ff4091f24370033a349b72ba222a30ed039b6f.camel@linux.ibm.com>
Subject: Re: SVSM Development Call April 3rd, 2024
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Yao, Jiewen" <jiewen.yao@intel.com>,
        =?ISO-8859-1?Q?J=F6rg_R=F6del?=
 <joro@8bytes.org>,
        "svsm-devel@coconut-svsm.dev"
 <svsm-devel@coconut-svsm.dev>,
        "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>
Date: Wed, 03 Apr 2024 08:18:46 -0400
In-Reply-To: <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
	 <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y2lfKOlSnUdi0uvt9DBp8btRFUhskeMG
X-Proofpoint-ORIG-GUID: Y2lfKOlSnUdi0uvt9DBp8btRFUhskeMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_10,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=707 lowpriorityscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404030085

On Wed, 2024-04-03 at 11:59 +0000, Yao, Jiewen wrote:
> Hi Jorg
> Probably you already notice that I have raised the question on vTPM
> interface in coconut-svsm.
> 
> I have explained how we did the POC in a secure way for TD-
> partitioning with TPM CRB buffer.
> Jeremi Piotrowski also explained the mechanism to expose vTPM through
> TPM CRB MMIO. In Intel, we still don't understand why SVSM must use a
> specific vTPM protocol, but not use TCG defined TPM2 CRB buffer
> directly.

Nobody has said *must*.  The enlightened interface was designed after
we had all the trouble with the CRB one outlined in the previous email
thread, so that's what this pull request has.  However, this being open
source nothing prevents you submitting a pull request for a functioning
CRB interface if that's what you want.

James

