Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190C534550
	for <linux-coco@lists.linux.dev>; Thu,  1 Feb 2024 02:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706755947; cv=none; b=NZzepg+Avl7XcRbEMeQYo5QgWlkS/zpFpNhOVnMHJwicdq2w8uo4YzHh2iWh+WLarS4YnE7dySvEf1CzjuSGJdREfL2Lnbcn5iPjzzfcnUByF8guy0MXanGXzZ5E0nOl11hiruQeRIcqBAAn0U/Q/MRez9ILLCJrjgEa1n4fgG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706755947; c=relaxed/simple;
	bh=VE/sh02bs3Pzqdd1/pbGh/uNg084WQ6X3hDLMjvsc8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5K4EwO/aMF4S0EijSbri7TxR5wVDLPUiP9eWHLeVKAnp0lSQEhbpsHgTIbaJ+cmibVdKjLIqOXPkqlJfInk7KdYsFqxCMQ3WnNfyXTA7ZpciqAjMaRC0+C7Gl+J/zsYAJclUBFcX2bIW1e9bFaYcnpDTdX437vUeNvqO2RIu+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZqtCYNb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZqtCYNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706755946; x=1738291946;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VE/sh02bs3Pzqdd1/pbGh/uNg084WQ6X3hDLMjvsc8I=;
  b=eZqtCYNb2/6gSMqvtYV3D7i+HVT6nWqKjlsPIFQvLEv+lpvdmYECOMG4
   XYQQzRCfGJCQ9skjN1kegdXhKXZNlkZm86iW2br2h72bHZ0Q9QsSaa93h
   Z/kUqY1XcvjDCV9posSaaGyUtcZAqgFC4BKteTgGjN1tbuHhyrbBXYmK8
   fDjcneG8DiiS/GjBlG73OFJTDgWQMmg+HvFsdwEjwEKJ1PSRqlZWxfDAO
   fD0xTH4wppRueVE6u6DPOa+wGjEgR+vhaTwd+AdDBvD/28Sfgz774qxEi
   CLvZitcP8YWf11MSngrkr9LIFHOzNrA8zTcjQFhEX63Dn0bHPcuBAnLDA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="22294791"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="22294791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 18:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4253702"
Received: from mannguye-mobl.amr.corp.intel.com (HELO [10.209.56.25]) ([10.209.56.25])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 18:52:26 -0800
Message-ID: <73584c9a-5779-4052-a8cb-138048f16f60@linux.intel.com>
Date: Wed, 31 Jan 2024 18:52:24 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev,
 x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com,
 dan.middleton@linux.intel.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
 <Zbq04j1Av2znlKIC@redhat.com>
 <65bab7cdc650e_37ad294e1@dwillia2-xfh.jf.intel.com.notmuch>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <65bab7cdc650e_37ad294e1@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/31/24 1:12 PM, Dan Williams wrote:
> Daniel P. Berrangé wrote:
>> On Wed, Jan 31, 2024 at 12:44:46PM -0800, Kuppuswamy Sathyanarayanan wrote:
>>> On 1/31/24 11:50 AM, Dan Williams wrote:
>>>> Kuppuswamy Sathyanarayanan wrote:
>>>>> + Dan Middleton
>>>>>
>>>>> Hi Boris,
>>>>>
>>>>> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
>>>>>> IOCTL based interface was the natural choice for interacting with the
>>>>>> quote generation machine at a time when there wasn't anything better.
>>>>>> Fortunately, now we have a vendor-agnostic, configfs-based one which
>>>>>> obviates the need to have the IOCTL-based interface.
>>>>>>
>>>>>> Gate the relevant code behind a Kconfig option, clearly marking it as
>>>>>> deprecated as well as introduce a runtime warning.
>>>>>>
>>>>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>>>>> ---
>>>>> In the following thread, Dan Middleton raised a point about this interface
>>>>> being used for local attestation use cases.
>>>>>
>>>>> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
>>>>>
>>>>> Currently, the configfs-based ABI does not support the local attestation use cases.
>>>> What are local attestation use cases, and what happens if Linux does not
>>>> provide a local attestation interface and standardizes on remotely
>>>> attestable as the standard?
>>>
>>> Local attestation is used by one TD on the same platform to prove to another TD
>>> in the same platform about its identity. It is mainly used in cases where a TD provides
>>> some special services required by other TDs. Since they are all in the same platform,
>>> there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
>>> to check the correctness of the TD.
>> As an example of where this might be needed, consider supporting a vTPM in
>> TDX. The TPM impl would likely be run in a separate service TD, and need to
>> be locally attested by the primary TD, to establish trust in the vTPM.
> Service TDs are in active deployment? How does that work? A tenant pays
> the fees to host 2 VMs? Is that more economical than just communicating

For scalability or security reasons, CSPs can choose to host the VMM services
in a separate VM guest. Since the service VM guest generally extends the TCB
of the tenant VM guest to which it provides service to, it is considered secure. A
single service VM can provide service to multiple tenant VMs. Since service VM
implements host services, I don't think tenant has to pay for two VMs.

In TDX, we already use service TDs for  TD Migration. Related TVMCALLs are defined
in TDX 1.5 GHCI specification, section "TDG.VP.VMCALL <Service>"
(https://cdrdv2.intel.com/v1/dl/getContent/726792)

> the remote verifier? Not trying to be argumentative just trying to get
> to the root of the question "why Linux must care about local
> attestation".

I think the main use case is when a tenant VM wants to use services provided
by a service VM in the same platform.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

