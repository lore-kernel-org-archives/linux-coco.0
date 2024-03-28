Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C519B7EEED
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711627403; cv=none; b=slJTepbWGrHxgQPTGHZQcjtHftZn5+NA94wh42nvgBGaG3aUpOk+GY6/S8+BlFGFrARfh5LtOI3sFK8r3wq2sxgGN4d41mPYsxtIfr1xA0vhO0DdXMvygHCL8pi5V8rIDhigIWv00S6N2fbH5PgIJDevHrDK63U/6mlBsrHN64I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711627403; c=relaxed/simple;
	bh=dsSGS+f6A2rJHuOj06Zwlky9ftEWj/uVUsruJ+0aFU8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NBkAeqLvDqxyjbEGKwSlCkaOJZ2nRb+NI8KffilNka1zlD8SxGcg06BHBKHuRxuScQSp2ArMaCd+0yhUVjS7a3QM2lL8J6lAtap6CzXf11ZnJlCXm4+X4lm4BNSyTM7oof2PUAjM07tYncbwfJdEV5itjJzGqvpx7XQbzaran84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=D8yErm4x; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="D8yErm4x"
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42SBRisC004397;
	Thu, 28 Mar 2024 12:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=bYhxhtxAjbypuLMg0AQNwVJkplG/0QL0xekjVajQdy0=;
 b=D8yErm4x4LW/hbODK8R786Wjn16jQoOZhhfdF5yPHuN49eIo/bYMv40U7l3uXj/VRP82
 1NetPCPwZGEuqpfWB3S+IMJMhNkgCkOgOu6cgXVdV/Vhud740kUq6ZYYqqDwv/P92CcX
 H7zCxOpR3mihv4yTujzo5u1jNyH0kaqURPFH4EGr7uCzD4sbSqNRxXnF0xM7QtJnSh5i
 uCzjwtnSKAqBXz+T5Q39vzKjRZmzRUubTVvwpn5iz4V4Jqs/pUdWMcgWg/h9WThBGRPp
 foXxeBHMjQiY3Vy6RB66KaXvpyEdUhMhR5yvSQ44AexnChL681S/Tqi/eTGcsqUb/rH3 oQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x57pg82p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:03:18 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42SAD66E013370;
	Thu, 28 Mar 2024 12:03:17 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x29t0wfkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 12:03:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42SC3EGR30671612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 12:03:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E542C5805F;
	Thu, 28 Mar 2024 12:03:14 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E59A58051;
	Thu, 28 Mar 2024 12:03:13 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.67.36.124])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 12:03:12 +0000 (GMT)
Message-ID: <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
Subject: Re: question on vTPM interface in coconut-svsm
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: "Yao, Jiewen" <jiewen.yao@intel.com>,
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
Date: Thu, 28 Mar 2024 08:03:11 -0400
In-Reply-To: <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
References: 
	<MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: miULvpt2kaSvgYmsy41vtpQ7QLYZKKjY
X-Proofpoint-GUID: miULvpt2kaSvgYmsy41vtpQ7QLYZKKjY
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_11,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403280082

On Thu, 2024-03-28 at 06:29 +0000, Yao, Jiewen wrote:
[...]
> At same time, we have also prototyped vTPM support for TD-
> partitioning based on coconut-svsm [1]. For vTPM interface, we just
> reused the original TCG defined CRB interface in TCG PTP
> specification [7]. 

If I could ask: where's the code for this?  We also did a CRB prototype
for the first papers on SVSM vTPM:

https://dl.acm.org/doi/abs/10.1145/3627106.3627112

But we found several difficulties with the CRB interface that doing a
platform one overcomes.

> We modified coconut-svsm to provide TPM CRB device model + TPM2
> library reference code. It is similar to [3]. The only difference is
> that we don't use vTPM protocol [4], but use TPM CRB interface [7].
> We mapped the TPM CRB MMIO (0xfed40000) as private MMIO which is only
> accessible between trusted L1-VMM (coconut-SVSM) and L2-Guest
> (Linux).

So how do you do this? we had the CRB ACPI tables set up by QEMU for
the above, which requires modifying QEMU to provide the TPM description
but not activate any backend interface (i.e. a new configuration flag).

The second problem is that ACPI described regions are by default, being
device buffers, shared not private (i.e. anyone can snoop the TPM
commands).  You can modify the OS to override this, but then you need a
very specific recognition of the TPM as being provided by the SVSM not
QEMU otherwise you'll block any emulated or real CRB TPM device when
total memory encryption is enabled.

Finally the start mechanisms are bit or ASL method based.  The bit
based one is just too much overhead if you handle the fault in the SVSM
and the start method doesn't provide enough sophistication to activate
the SVSM entry protocol.  We eventually modified the CRB driver to do
the SVSM start but, again, this is hard to reconcile with a standard
CRB interface.

>  The untrusted host VMM cannot access the TPM CRB MMIO.
> The TPM CRB interface is reported via TCG defined TPM2 ACPI table
> [8]. The TPM2 ACPI table exposes StartMethod as
> EFI_TPM2_ACPI_TABLE_START_METHOD_COMMAND_RESPONSE_BUFFER_INTERFACE
> (6), see [9]. And we don't need _DSM for StartMethod, see [10].

So publishing the code for this would allow us to evaluate whether it
might work for SEV-SNP as well but our experience above tells us it was
a lot of code modification in the OS and QEMU and even more (which we
didn't do) to make the CRB driver still work with non-SVSM devices,
which is why it's easier to do a small and simple platform device which
requires small OS modifications, no QEMU changes and an easy attach
when the SVSM is present.

James

