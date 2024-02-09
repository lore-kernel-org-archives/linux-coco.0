Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F11370
	for <linux-coco@lists.linux.dev>; Fri,  9 Feb 2024 02:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707445410; cv=none; b=XgBv0PaYtdhLw66EkCvpKqjzZZVVThIRmBnIYns/C8uRtNhApwg38AdjJKPheq2nz1NJKxTI4os6gEwx9VtyhnoKcOZ4OajB4S3R8e2vJVU0lVx3JaxSuCygMErzdfOK/OBd+9L+36KU95qGJMQQpmhigVjJsLl2bzjIpecc/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707445410; c=relaxed/simple;
	bh=wSJoUIvWctrPci0MbTnpfD96bnuEhKnlVbUo9qwudA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwlTKjJdWzw497tfRLb4xeo2VTcjIacmFIE8f/SPBTQZ0VAu6kJwPNkQEFBmsACqZEITR9WTXg6zkV2wr6GlnuqwtbYTdOKuEYoPbmDh1x1yE9VAT7vQlBzaE0GnGl/NkHCJOPV+i3gb0xvoXsG7rh5B9x8ZLTSvTr793jXBu7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsPE8Dsw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsPE8Dsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707445409; x=1738981409;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wSJoUIvWctrPci0MbTnpfD96bnuEhKnlVbUo9qwudA8=;
  b=OsPE8DswCB2PZVXuuvaivUJohPRMUrFwkFVK7V4CWn0PKqPirFKtefMe
   5j5frG62paUPtR0juc3Kad9pKjlrPL08R28Sxa0J4b8sJJY9twImTV303
   vMlExWwSHlrBOiaTVxz6dZUoeMYGGuudZUZ3DpcVPyrPpGCgaCSXhMVBE
   TXTcWdgO7WnuySIiKii+BtNZzcoQ/lmvT0aeyxPGeSOre94+9OHJlfcm/
   BiEqCw87mJNVlnqHxUG88CktD9teKjnABq8JHQFmz+LAuRUysz1CT/1RF
   tuAnpS0uZaRAs97bbT7+/DqPDBaWKc6AHmidZRl4An8VnZ8mMgtw25AkD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5177808"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="5177808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 18:23:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6468209"
Received: from dcmiddle-mac01.jf.intel.com (HELO [10.241.224.238]) ([10.241.224.238])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 18:23:27 -0800
Message-ID: <bb5543c8-b14e-42cb-a13b-9467fa87622f@linux.intel.com>
Date: Thu, 8 Feb 2024 18:23:25 -0800
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
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev,
 x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
 <65bab6ef2a198_37ad2948b@dwillia2-xfh.jf.intel.com.notmuch>
 <ZcTaW3gKIWWF1fKS@himmelriiki>
From: Dan Middleton <dan.middleton@linux.intel.com>
In-Reply-To: <ZcTaW3gKIWWF1fKS@himmelriiki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/8/24 7:42 AM, Mikko Ylinen wrote:
> On Wed, Jan 31, 2024 at 01:09:03PM -0800, Dan Williams wrote:
>> Kuppuswamy Sathyanarayanan wrote:
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
>>>
>>> I am not sure about actual local attestation users. May be Dan can share that info.
>>>
>>> Regarding your question about using "remotely attestable as the standard", I think
>>> remote attestation can handle all local attestation use cases. But, does it make sense to
>>> force users to run a Quoting service if they don't need to communicate with 3rd party
>>> servers?
>> SEV-SNP seems to get by without a local attestation flow, if I am not
>> mistaken, so the question is why should the kernel support cross-vendor
>> divergence here? Remember, the kernel ends up being the "standardization
>> body of last resort", it does not need to onboard all the complexity it
>> can find.
>>
>>> SGX also seems to have local attestation concept
>>>
>>> https://sgx101.gitbook.io/sgx101/sgx-bootstrap/attestation/inter-process-local-attestation
>> I am less concerned with concepts, and more concerned with use cases.
>> For example it could be the case that configfs-tsm needs to grow to
>> support local attestation for multiple vendors, but that should be due
>> to concrete use cases to be deployed, not theoretical observations.
> Confidential Containers project started using the tdx_guest ioctl() to get
> the TD report. This is used by the attestation-agent to check that the hash
> of a policy file is correctly included in the TD report's MRCONFIGID field.
>
> The report stays within the TD and there's no need take it to the host QGS
> quoting service for signing. Right now we need to go to configs-tsm for
> the quote and tdx_guest ioctl() for the TD report.
>
> The corresponding SNP check in this use case is to get the HOSTDATA report
> field by using 'get report' ioctl() (non-ext version is enough). With
> configfs-tsm this is same as using just 'outblob' and ignoring 'auxblob',
> AFAICS.
>
> However, perhaps some generic report 'type' TSM report attribute would be
> justified here to allow users select between TD report/quote and
> report/ext_report generation?
>
> -- Regards, Mikko
Sorry, I somehow missed the continuation of this thread.

I think there's a couple use cases mentioned here including
1. Service TDs like vTPM (there is code for this[1]. I can't speak to 
its adoption.)

2. Locally verifiable evidence as visible in CNCF CoCo (thanks Mikko).

I don't think it should be deprecated until / unless there is a
committed alternative like a configfs-tsm feature.
I don't know the kernel community's preference for a single vendor
configfs-tsm feature vs a single vendor ioctl.

I would suspect that other vendors will offer local attestations based
on local appearing in SGX and TDX, but that's speculation. If so their
APIs would better inform a new common configfs-tsm feature.
Maybe people with knowledge of AMD, Arm, and RISC-V disclosed plans can

comment.


[1] https://github.com/intel/vtpm-td/tree/main


Thanks,
Dan Middleton


