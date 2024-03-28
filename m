Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F514294
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711634102; cv=none; b=aqzxC74AgNGzsUnlAtrzWozdE65cSPkwk4zOU7B7YpSyK96Hox2yjchNSYYw+c8WYQyO/O/4gd4xa3nnDGmCofDl08gBQGOKHc/PDr/8ELHvTaxLif9hYSphJ/3ifkyC4puU638KnB5ZI/QM3ni19locyqeeY4ai8xIelf8tbeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711634102; c=relaxed/simple;
	bh=yhfijazcoOZFMlfjc267OeMPMPbctZG8FizkiuQW0YU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uIXSLvRP/4XViekijveEp462vVrmKdDLGQ2chYeE2JlWAoN35f1RY2u4T8BRDo9oebHggf+r/hRWq4YXIYWpQ7r/Z6Ftgs4mhuHwX16cV+U2m84gI4gcinPgMXACpudDoM0UIugEuqp0e1ZixxPSLODKCEvN918PUsGO1hh+RbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=L1GbsGzZ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="L1GbsGzZ"
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42SDewqZ001355;
	Thu, 28 Mar 2024 13:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=qf4vcG5p0WTtgfEk0HeouHJVEKziRsZEzeJEmhYQOo4=;
 b=L1GbsGzZ+F/jKnqzXTmlrGudGxshvBOH9ecFjh/PjVpBvmgm8GbjfAtWTwkre20dUiyE
 eM1FlD8NYv377gS+DRY933I3SQKTlysjOEjnpFmr92AGvMJr5IDjezswVg0ZHAKJKWwA
 SdChQJpDN+gctjIj7G0h9hfz7NyDRa6Sk3ETGlBrb59aR2xWHtaDjrydy1UAUvd1l4iq
 JFBiKWAK3k4cScfEjlB92H15n5lPiKHLDISh5Ov3jD4PJGv3cqwxIqLuP6EsmYP2sUjh
 Is+NNy5DsppaGFUT0cyQ2Esv0nTizSWkJYGg5lwMRdx8Mw6dWESkg2lnjZZFFl6HAsTx fw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x58jp067u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 13:54:56 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42SAnPP5028675;
	Thu, 28 Mar 2024 13:54:55 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adpnt52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 13:54:55 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42SDsrad23986820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 13:54:55 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0FC65805F;
	Thu, 28 Mar 2024 13:54:52 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 057B758051;
	Thu, 28 Mar 2024 13:54:51 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.67.36.124])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 13:54:50 +0000 (GMT)
Message-ID: <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
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
Date: Thu, 28 Mar 2024 09:54:49 -0400
In-Reply-To: <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
References: 
	<MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vxyML9S0vGXXS7HRTiinJjiWRzHpPJvf
X-Proofpoint-ORIG-GUID: vxyML9S0vGXXS7HRTiinJjiWRzHpPJvf
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
 definitions=2024-03-28_13,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 mlxlogscore=820 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2403280094

On Thu, 2024-03-28 at 14:41 +0100, Jeremi Piotrowski wrote:
> On 28/03/2024 13:33, James Bottomley wrote:
> > On Thu, 2024-03-28 at 13:22 +0100, Jeremi Piotrowski wrote:
> > [...]
> > > Azure ships the configuration described above for SEV-SNP (and
> > > TDX).
> > > The TPM is implemented in an "SVSM"(paravisor), exposed through
> > > TPM
> > > CRB MMIO. The kernel has a callback informing ioremap which MMIO
> > > addresses should be considered shared/private [1]. This is the
> > > Hyper-
> > > v implementation of that callback: [2].
> > > 
> > > So it can work if you detect it like this:
> > > 
> > > if (SEV_SNP_GUEST && SVSM_PRESENT && SVSM_PROVIDES_VTPM)
> > >    // vtpm should be mapped private
> > 
> > Well, yes, it's pretty much identical to the detection mechanism
> > used
> > to activate the platform TPM driver:
> > 
> > https://lore.kernel.org/all/83bcfc398d885f9e42d5aae42359fe02ab12d306.camel@linux.ibm.com/
> > 
> > The SVSM_PROVIDES_VTPM is actually a dynamic probe to find the vTPM
> > protocol inside the SVSM.
> > 
> > So what's the mechanism hyper-v uses to start a CRB command?
> > 
> > James
> > 
> 
> Do you mean start method? The VTPM uses ACPI_TPM2_COMMAND_BUFFER, the
> guest sees a TPM2 ACPI table, maps the control address as private and
> then the tpm_crb driver just works.

Not without help.  The usual method of starting a CRB command is to
write the command buffer and length into the CRB registers and then set
the start bit (a real CRB device monitors the control area).  Since
they're all in the same page, you can emulate what a real device does
by unmapping this area in the guest kernel and getting the SVSM to
intercept the writes, in which case you see a lot to fix up and quite a
number of VMEXITs per command, or you can ignore this region and use
some type of ASL start mechanism instead, which means only one VMEXIT.
What does hyper-v do?

James

