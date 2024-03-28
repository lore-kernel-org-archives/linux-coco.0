Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8330A82883
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711633276; cv=none; b=Ols5YnRPMYGMk3hb1BwnB68tHcd2+BQ6UbY9Nr43+OLlwc3rqZF/QKiNHp5G798ODd89TcJCQ4ydUkyImoPdciKde2Mf2d/TPvZMuwDWubHjY+U4mr+wRNW7mSjcPpFSmKNeJ9LFnyF15DUPf60EwLu0G0fxqUkh4gasEV3yglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711633276; c=relaxed/simple;
	bh=l+60L4RyFRhGyLDdpYBCEiiVaRRx1CWnR7NMEnz3TOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AODfRns06iN+agjYOy2U4iRtbtXrA6V7XfA5CHB6jn3A1lCc1C7aI9V6J3vsXGp3yuN8Z3cTZHAUDIOknG7TbGGrn84ntq9Au4wO7grN0JkDqEmL+BRVfovlll/TvmkXAXYxNpTMFy+VZhKf8GUrwAEfhEy2WQUVZD+nzZg5vsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=H+J14mOg; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="H+J14mOg"
Received: from [100.66.160.44] (unknown [108.143.43.187])
	by linux.microsoft.com (Postfix) with ESMTPSA id 145CE20E65E2;
	Thu, 28 Mar 2024 06:41:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 145CE20E65E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711633274;
	bh=gd7ysmY+IsNe2L7SHfVWJB7iqKSV9M6N3C9+V9Wj10k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H+J14mOg2DVli1uPuBhxFYs1zIuQ/y2TuelOeHe0rZ0zykaSyKel+QmEv/UtJdmyY
	 UVhlCNsUiT2HNl/ZXykXRlZ/fyja2misDVa6DhGKH0MQY/n008z4gVdP/arCuxto8/
	 oXSao0wtH6NI7NxEkXcbGOVJEnAQ86uZ8pStfFLM=
Message-ID: <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
Date: Thu, 28 Mar 2024 14:41:11 +0100
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
Content-Language: en-CA
From: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
In-Reply-To: <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/03/2024 13:33, James Bottomley wrote:
> On Thu, 2024-03-28 at 13:22 +0100, Jeremi Piotrowski wrote:
> [...]
>> Azure ships the configuration described above for SEV-SNP (and TDX).
>> The TPM is implemented in an "SVSM"(paravisor), exposed through TPM
>> CRB MMIO. The kernel has a callback informing ioremap which MMIO
>> addresses should be considered shared/private [1]. This is the Hyper-
>> v implementation of that callback: [2].
>>
>> So it can work if you detect it like this:
>>
>> if (SEV_SNP_GUEST && SVSM_PRESENT && SVSM_PROVIDES_VTPM)
>>    // vtpm should be mapped private
> 
> Well, yes, it's pretty much identical to the detection mechanism used
> to activate the platform TPM driver:
> 
> https://lore.kernel.org/all/83bcfc398d885f9e42d5aae42359fe02ab12d306.camel@linux.ibm.com/
> 
> The SVSM_PROVIDES_VTPM is actually a dynamic probe to find the vTPM
> protocol inside the SVSM.
> 
> So what's the mechanism hyper-v uses to start a CRB command?
> 
> James
> 

Do you mean start method? The VTPM uses ACPI_TPM2_COMMAND_BUFFER, the guest sees a
TPM2 ACPI table, maps the control address as private and then the tpm_crb driver
just works.

Jeremi
