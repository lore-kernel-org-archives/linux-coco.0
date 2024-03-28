Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FE07E10C
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711634979; cv=none; b=OvAYTUxJiDEATIMC5nXhHvUCsqTsNFvqY+spTk0pQdaTBl7fsiEh/fGuAkG4bxkPWMRq1PfrpxZuRdyFmn0ukczYTwGTKO4qjbLlmEEH4B5X9Xgb4dTDfXKICVoBVvuaK8DG3qQYGEPfECUklcBaskSVpRmrDgHvpzARhKgdIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711634979; c=relaxed/simple;
	bh=re5fzbWzpgrXOIwgq3dJl6Wr2rlT1/GlcoO/dh82Qg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePW9Msewy8oke1DbHvEf+MCA/QT9dklwpS5S61BvDF5ql3qiUbGeB1UY4JHEWTJ57VF9VaIwDK0JBth/zqzvmCgXQkULo0bOCL0xTyMSM4urm+3a9yt+YYgxZ1Iixh0dCJeq07mo7y3/MGC4VDZH0UNYLPN+cAwnM6dG4ic6LiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=kayfIVpU; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="kayfIVpU"
Received: from [100.66.160.44] (unknown [108.143.43.187])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7D6C120E6AE7;
	Thu, 28 Mar 2024 07:09:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7D6C120E6AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711634977;
	bh=d7FyEpLn+EJbormDgnLA2eShTb/B9DY598zyBTZmT2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kayfIVpUEVIvRa8RXW1aglonwXuFEUhwwEK6n/0rNfC1+yDr7FEXm8dt4qusSBDxk
	 XGIOm3F+1i6o/CKENxn1XBFQgmaQfOt9wbIuu4FzhcvwZsXR6l7rzsGPY8me1qg/as
	 kwc9FvSVdKxD8oh+KMuQ7+i92+rH5nbp9dGzN63o=
Message-ID: <d31cd2bb-f671-41d6-a6e4-4a72bdf6f182@linux.microsoft.com>
Date: Thu, 28 Mar 2024 15:09:34 +0100
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
 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
Content-Language: en-CA
From: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
In-Reply-To: <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/03/2024 14:54, James Bottomley wrote:
> On Thu, 2024-03-28 at 14:41 +0100, Jeremi Piotrowski wrote:
>> On 28/03/2024 13:33, James Bottomley wrote:
>>> On Thu, 2024-03-28 at 13:22 +0100, Jeremi Piotrowski wrote:
>>> [...]
>>>> Azure ships the configuration described above for SEV-SNP (and
>>>> TDX).
>>>> The TPM is implemented in an "SVSM"(paravisor), exposed through
>>>> TPM
>>>> CRB MMIO. The kernel has a callback informing ioremap which MMIO
>>>> addresses should be considered shared/private [1]. This is the
>>>> Hyper-
>>>> v implementation of that callback: [2].
>>>>
>>>> So it can work if you detect it like this:
>>>>
>>>> if (SEV_SNP_GUEST && SVSM_PRESENT && SVSM_PROVIDES_VTPM)
>>>>    // vtpm should be mapped private
>>>
>>> Well, yes, it's pretty much identical to the detection mechanism
>>> used
>>> to activate the platform TPM driver:
>>>
>>> https://lore.kernel.org/all/83bcfc398d885f9e42d5aae42359fe02ab12d306.camel@linux.ibm.com/
>>>
>>> The SVSM_PROVIDES_VTPM is actually a dynamic probe to find the vTPM
>>> protocol inside the SVSM.
>>>
>>> So what's the mechanism hyper-v uses to start a CRB command?
>>>
>>> James
>>>
>>
>> Do you mean start method? The VTPM uses ACPI_TPM2_COMMAND_BUFFER, the
>> guest sees a TPM2 ACPI table, maps the control address as private and
>> then the tpm_crb driver just works.
> 
> Not without help.  The usual method of starting a CRB command is to
> write the command buffer and length into the CRB registers and then set
> the start bit (a real CRB device monitors the control area).  Since
> they're all in the same page, you can emulate what a real device does
> by unmapping this area in the guest kernel and getting the SVSM to
> intercept the writes, in which case you see a lot to fix up and quite a
> number of VMEXITs per command, or you can ignore this region and use
> some type of ASL start mechanism instead, which means only one VMEXIT.
> What does hyper-v do?
> 
> James

Now I get it, thanks. It's based on intercepting writes.

Jeremi
