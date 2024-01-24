Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8093D1B592
	for <linux-coco@lists.linux.dev>; Wed, 24 Jan 2024 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706096999; cv=none; b=jq+wtKauA3NQHow5OaS2V4+Y8jB3Ode7IbBxvP8irYD8lg8ymSBd3wQ1EWLLqSzfgBs92NPi7AttWbr6+oXI9tL5yla4Ppb44uM1WcT6ZYPWUB4Lt5sE+JunSxYBPoxKF8l36DBoRDLh7UFdPVbdQ1//paNB99i0G4uABJDd9wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706096999; c=relaxed/simple;
	bh=bOmdQFFnlsI98JvifJBMSVzxN5noEKx0jP99ZVdS7NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3/exvSPWlloQt81wHxhcPGplyavAUy+FTGjF/7N0Q1+zVG0IzCTk1SQH1IWfJHSkTdNoCdBwS//+xYQmVRon2YavhKW4e1OIImmWouih+Dm7JOcPvXo4obMVKaJlwXbwPkEb1rTaGPgjlZ8SKpTnxSyZ8WcU5xrBWwh6ngav7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=kuWrcuBI; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="kuWrcuBI"
Received: from [192.168.1.212] (181-28-144-85.ftth.glasoperator.nl [85.144.28.181])
	by linux.microsoft.com (Postfix) with ESMTPSA id 93F7820E34F0;
	Wed, 24 Jan 2024 03:49:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 93F7820E34F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1706096998;
	bh=GjRxSdqCKq2z3wCMpH2/II5GsafX4QuIERVof3DOZ/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kuWrcuBIoWsk7Uv7pvVLOjz6wWa9VzwvX42N4rgy6QG8ZURL+deEHRaIxCcVv5HlN
	 GgJUfStm+uYZ8JAkvnA8JDLqyBHZhdkE15V4w/auxvJYr3GoiRQ3K6Sc5Gn5Z/9P06
	 0/NVg96O+4arfbh32rQirSCpX7geMEYmGDUsRXkc=
Message-ID: <0c6af28e-b2d6-48b8-90c9-e99a47260904@linux.microsoft.com>
Date: Wed, 24 Jan 2024 12:49:54 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-coco@lists.linux.dev, dave.hansen@linux.intel.com, x86@kernel.org,
 kirill.shutemov@linux.intel.com
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
 <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
 <65b00e191087c_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <ZbAaKAh-230Hj4BF@redhat.com>
 <65b01d00cae32_37ad29499@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
In-Reply-To: <65b01d00cae32_37ad29499@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2024 21:09, Dan Williams wrote:
> Daniel P. Berrangé wrote:
>> On Tue, Jan 23, 2024 at 11:06:01AM -0800, Dan Williams wrote:
>>> Nikolay Borisov wrote:
>>>>
>>>>
>>>> On 23.01.24 г. 19:51 ч., Kuppuswamy Sathyanarayanan wrote:
>>>>>
>>>>> On 1/23/24 8:07 AM, Nikolay Borisov wrote:
>>>>>> When this driver got merged initially there was no widely agreed upon
>>>>>> interface how the quote generation interface will work so having an
>>>>>> ioctl made sense. However, there's now a vendor-neutral interface via
>>>>>> configfs. Just remove the old ioctl interface and leave only the the
>>>>>> configfs one.
>>>>>>
>>>>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>>>>> ---
>>>>>
>>>>> This ABI allows the user to get the raw report which is further used
>>>>> for Quote generation via vsock. AFAIK, some vendors (TDX users) and
>>>>> DCAP user libraries are still using this ABI to support attestation over
>>>>> vsock model.
>>>>>
>>>>> Don't you think we should wait till there are no users before considering
>>>>> removing it?
>>>>
>>>> Given that hw with TDX was just released I'd be surprised if there are 
>>>> any users? But then again, this is an RFC so let's get opinions :)
>>>>
>>>
>>> The assumption is that this tdx_guest_ioctl() ABI has never appeared in
>>> an enterprise distro kernel. If that assumption is valid, it
>>> significantly reduces the long term support exposure.
>>
>> This ioctl is present in current RHEL-9 kernels
>>
>>   https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob/main/drivers/virt/coco/tdx-guest/tdx-guest.c?ref_type=heads#L69
>>
>> and this is exposed to users when running RHEL-9 guest on Azure
>> cloud with TDX support.
> 
> Ah, ok, thanks for looking that up. Also good to see the new interface
> is also backported into that kernel.

Azure TDX instances don't actually have access to that ioctl() interface because
they run with TD partitioning and that module call is not exposed to linux. The
TD report is used to chain trust to the TPM provided by the paravisor (TD L1),
the TD quote can be fetched through a TPM NVRAM index.

So I wouldn't block removal on this.

> 
>> I've not directly checked, but I would assume it is also probably
>> included in Ubuntu LTS kernels too, since they also target TDX in
>> Azure.
>>
>> No idea what the status of SLES is wrt TDX / Azure offhand.
> 
> Seems like this needs to follow the typical upstream deprecation of
> notifying in Kconfig and maybe a runtime message, and then circle back
> in a couple years to remove when distros stop enabling the legacy
> interface.

