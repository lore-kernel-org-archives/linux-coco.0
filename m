Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0977E590
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711628536; cv=none; b=WGGPUdnhdCY5tHXcWKBNJA1SBkV1ss/ADh1Us37vNDAYeJpLDfEOLBSriuyU5tQz7T4s3K5ozA9QDIMNCjLEDyVRqaDw/S5N+Gi7Cu52/NgaCIX/3rwW1LAqtssm1vqzL2qO4B6NFLljZxAoCvomwoDAYwCKtBtvnH4phSixadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711628536; c=relaxed/simple;
	bh=Qmq5LRqVJrwSfibBf7+aGyOLqv3o9KK79CAXewDrBjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fD9hKbMaRc/GiaN2/eexOEU82vj3QxkgBo/9A8+lqltyr1krBMb4+YABfdSHuQUxLA3iBSMW7wkg2b9GgepKa4BirerQoLl48aBzq0p9Oh+Rnt7ayiGQItBuPhk/R7BTmJTMjG0ZiwOeGkzOx09ZFzU3pMwFlPcpMkkiUY9fV/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=MzMQJYlr; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="MzMQJYlr"
Received: from [100.66.160.44] (unknown [108.143.43.187])
	by linux.microsoft.com (Postfix) with ESMTPSA id 52F222095976;
	Thu, 28 Mar 2024 05:22:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 52F222095976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711628534;
	bh=wA2YIWTi/D7/D60GQe0/AiknrLniVqZuAESuikwI5WQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MzMQJYlrJjCQ3A1zn6A2QHwRZewfArb6/FP/3ZBT3hRAImC3MOv8QpRdQFPyjsOuU
	 dgdkSDfBvgUY9zJmy/UWof5xKCr46AYU0THp1cdA500Rv3OaeI9toWeBsgXfMyPimn
	 D7DqvGdF9cnB4PmvrS2B3ZxeYMoF7Wv7izbWFOic=
Message-ID: <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
Date: Thu, 28 Mar 2024 13:22:10 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: question on vTPM interface in coconut-svsm
To: jejb@linux.ibm.com, "Yao, Jiewen" <jiewen.yao@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Cc: Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
 Joerg Roedel <jroedel@suse.com>, "Lange, Jon" <jlange@microsoft.com>,
 "Dong, Eddie" <eddie.dong@intel.com>,
 "Johnson, Simon P" <simon.p.johnson@intel.com>,
 "Reshetova, Elena" <elena.reshetova@intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
Content-Language: en-CA
From: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
In-Reply-To: <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2024 13:03, James Bottomley wrote:
> On Thu, 2024-03-28 at 06:29 +0000, Yao, Jiewen wrote:
> [...]
>> At same time, we have also prototyped vTPM support for TD-
>> partitioning based on coconut-svsm [1]. For vTPM interface, we just
>> reused the original TCG defined CRB interface in TCG PTP
>> specification [7]. 
> 
> If I could ask: where's the code for this?  We also did a CRB prototype
> for the first papers on SVSM vTPM:
> 
> https://dl.acm.org/doi/abs/10.1145/3627106.3627112
> 
> But we found several difficulties with the CRB interface that doing a
> platform one overcomes.
> 
>> We modified coconut-svsm to provide TPM CRB device model + TPM2
>> library reference code. It is similar to [3]. The only difference is
>> that we don't use vTPM protocol [4], but use TPM CRB interface [7].
>> We mapped the TPM CRB MMIO (0xfed40000) as private MMIO which is only
>> accessible between trusted L1-VMM (coconut-SVSM) and L2-Guest
>> (Linux).
> 
> So how do you do this? we had the CRB ACPI tables set up by QEMU for
> the above, which requires modifying QEMU to provide the TPM description
> but not activate any backend interface (i.e. a new configuration flag).
> 
> The second problem is that ACPI described regions are by default, being
> device buffers, shared not private (i.e. anyone can snoop the TPM
> commands).  You can modify the OS to override this, but then you need a
> very specific recognition of the TPM as being provided by the SVSM not
> QEMU otherwise you'll block any emulated or real CRB TPM device when
> total memory encryption is enabled.
> 
> Finally the start mechanisms are bit or ASL method based.  The bit
> based one is just too much overhead if you handle the fault in the SVSM
> and the start method doesn't provide enough sophistication to activate
> the SVSM entry protocol.  We eventually modified the CRB driver to do
> the SVSM start but, again, this is hard to reconcile with a standard
> CRB interface.
> 
>>  The untrusted host VMM cannot access the TPM CRB MMIO.
>> The TPM CRB interface is reported via TCG defined TPM2 ACPI table
>> [8]. The TPM2 ACPI table exposes StartMethod as
>> EFI_TPM2_ACPI_TABLE_START_METHOD_COMMAND_RESPONSE_BUFFER_INTERFACE
>> (6), see [9]. And we don't need _DSM for StartMethod, see [10].
> 
> So publishing the code for this would allow us to evaluate whether it
> might work for SEV-SNP as well but our experience above tells us it was
> a lot of code modification in the OS and QEMU and even more (which we
> didn't do) to make the CRB driver still work with non-SVSM devices,
> which is why it's easier to do a small and simple platform device which
> requires small OS modifications, no QEMU changes and an easy attach
> when the SVSM is present.
> 
> James
> 

Azure ships the configuration described above for SEV-SNP (and TDX). The TPM is
implemented in an "SVSM"(paravisor), exposed through TPM CRB MMIO. The
kernel has a callback informing ioremap which MMIO addresses should be
considered shared/private [1]. This is the Hyper-v implementation of that
callback: [2].

So it can work if you detect it like this:

if (SEV_SNP_GUEST && SVSM_PRESENT && SVSM_PROVIDES_VTPM)
   // vtpm should be mapped private

Jeremi

[1]: https://lore.kernel.org/lkml/1678329614-3482-2-git-send-email-mikelley@microsoft.com/
[2]: https://elixir.bootlin.com/linux/latest/source/arch/x86/hyperv/ivm.c#L610
