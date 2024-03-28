Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CDE7E0FF
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711629321; cv=none; b=YiAqAdpxUWiCZkvqnmUO1Y2B2u6s/XUkux9VvIMpUswMdVhX+RTglhJhfOfwoMY8oWYNjnUlBtsS5hKOs0Pd2DSM+i7T8oCeXysFEnSLj0rnc4z4MKctmWFO21//Yeba0bVvujYqXk6xUfY6ycDDf1ndzaPa6D5mEYPYHDJRCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711629321; c=relaxed/simple;
	bh=GRGqDUo0/Vt1bc8Qo+1zX2cJ/DbxOudMLzocFFzpsrs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qwUYB/o95QNkfQhu8EvUO6oFjyT+9VJMY6Sy4jkcF9sOot7mUvSsCkpfItjzncQQm53qtXvybCTd4NyK4UuMLTWqEoYGpUWiJoP2WTcVi10qpx/dkehuzk3JKAQ7nOjqE438xPDS8XC7bEzfHuHqTILpcPv9K+Z84QEdNRs9X3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KABQTrZT; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KABQTrZT"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42SCMx02002244;
	Thu, 28 Mar 2024 12:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=YE1HKMJ063o4VNq3HqERRzB8rq0y1Y6T4w+wl8Hwobs=;
 b=KABQTrZTxzkqYtsAB0QsBhS5+d4fM3pRiOgUOyXkNAxTZXNyh+GSUyO6zbn30n2VjX2/
 hIqobpAGFUtbOm71rj96BnCbip4pjJAv8f2GVykbgRhFy0AKLIGh19XSCf36jGdom0W5
 fCJ/NEtJ9Y31yQFjmz9LgBPjm3HQE1Emq0IiSk2YJoh/XFDNSwlcq/33VA7UrGiKfKfP
 PvOimdTm1C716wzLnXvX+h4ANPkJDJFZs4tZzgCe4k+usyGQWO2iu2oKY5PfMZUcAfA3
 HoDyla3neayqafI08plwZ6gpukEOgHZb80pge6mZoBgd9HX38Tx17Q00fkkBNS5RPGDk LQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x587fr1vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:35:14 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42SAIO1F016410;
	Thu, 28 Mar 2024 12:33:11 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x29dudrpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:33:11 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42SCX81P62325238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 12:33:11 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDEB25805A;
	Thu, 28 Mar 2024 12:33:08 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA46758051;
	Thu, 28 Mar 2024 12:33:06 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.67.36.124])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 12:33:06 +0000 (GMT)
Message-ID: <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
Subject: Re: question on vTPM interface in coconut-svsm
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
        "Yao, Jiewen"
	 <jiewen.yao@intel.com>,
        "linux-coco@lists.linux.dev"
	 <linux-coco@lists.linux.dev>
Cc: Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
        Joerg Roedel
 <jroedel@suse.com>, "Lange, Jon" <jlange@microsoft.com>,
        "Dong, Eddie"
 <eddie.dong@intel.com>,
        "Johnson, Simon P" <simon.p.johnson@intel.com>,
        "Reshetova, Elena" <elena.reshetova@intel.com>,
        "Nakajima, Jun"
 <jun.nakajima@intel.com>
Date: Thu, 28 Mar 2024 08:33:05 -0400
In-Reply-To: <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
References: 
	<MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ECoek9DTOzxlDISVb6QlFEiMVPBhtK2p
X-Proofpoint-ORIG-GUID: ECoek9DTOzxlDISVb6QlFEiMVPBhtK2p
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0 mlxlogscore=791
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403280085

On Thu, 2024-03-28 at 13:22 +0100, Jeremi Piotrowski wrote:
[...]
> Azure ships the configuration described above for SEV-SNP (and TDX).
> The TPM is implemented in an "SVSM"(paravisor), exposed through TPM
> CRB MMIO. The kernel has a callback informing ioremap which MMIO
> addresses should be considered shared/private [1]. This is the Hyper-
> v implementation of that callback: [2].
> 
> So it can work if you detect it like this:
> 
> if (SEV_SNP_GUEST && SVSM_PRESENT && SVSM_PROVIDES_VTPM)
>    // vtpm should be mapped private

Well, yes, it's pretty much identical to the detection mechanism used
to activate the platform TPM driver:

https://lore.kernel.org/all/83bcfc398d885f9e42d5aae42359fe02ab12d306.camel@linux.ibm.com/

The SVSM_PROVIDES_VTPM is actually a dynamic probe to find the vTPM
protocol inside the SVSM.

So what's the mechanism hyper-v uses to start a CRB command?

James

