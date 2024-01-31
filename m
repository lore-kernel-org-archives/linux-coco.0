Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FDC20DE0
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 20:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706733891; cv=none; b=I1RBkIzX+MKnFmLZ4OqyxQqhe18XDjkj1WIm0E9KZEGwp9n6HvQz4UC3nfi1EG3TC2Dv2y7nF2H+tvcATWS54kkCBcYDQJkXgXMJY24OGME0aNnXBtQwgVb6VC/aoD7SDeIqYmQIY3VGiJpZzZ0y24vshnHYWyqXSmbm0lYnqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706733891; c=relaxed/simple;
	bh=kHN7BNBI5EH4kNeammkUSuRN5n+Qzd5PsJRKjJZE1r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOnfeGRjyNuMsIJso4A4owcPLE8pyF4smLeUeu34z6BEWWEqyYOA/SBK+q68PLgfdz8b7J87+Ueiv1PRi9VroPEZcRkNx7nwp5DnhWpuiM8ijENlvyWwlgToYqMVD7JRkwxZ6GLq/3ddZqPGkOjuKVEy6j4HkaJDlk5cHTyPsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buoSHWZy; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buoSHWZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706733889; x=1738269889;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kHN7BNBI5EH4kNeammkUSuRN5n+Qzd5PsJRKjJZE1r4=;
  b=buoSHWZyqiQ/XK3eB4z5qrVMbH5rPKC8GMmA8/6j5J2lutDaJRL0QdNO
   TSoAM42qrjTfuu8vfSrOArB5UsTGTBM5rBSAPBmQEMjbA7/NDr5CtN/oq
   rQvh/DIXB0U7jbr69oSU9ydWJjuMCixjDbPVlFP2b1H3liXW9MYNBcKC3
   EIcJX4zIP3KF9Emlp90nyMHZk/YiuSrEH+V2IKf9Q35RWKLB0VqTtBg1r
   p2yHci5MPkMt422ClVlQ4cwtNKsoAuAIz+91lU87lk3DrNZEHBaDjTs57
   9To8emwczejif8DYXhd/QBoPQVKKup1euOmRfGyoSnCBe0Hql3C/DHt+O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434891512"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="434891512"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 12:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931974323"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="931974323"
Received: from ktpate-mobl2.amr.corp.intel.com (HELO [10.209.73.130]) ([10.209.73.130])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 12:44:47 -0800
Message-ID: <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
Date: Wed, 31 Jan 2024 12:44:46 -0800
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
 Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev
Cc: x86@kernel.org, dave.hansen@linux.intel.com, dionnaglaze@google.com,
 dan.middleton@linux.intel.com
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/31/24 11:50 AM, Dan Williams wrote:
> Kuppuswamy Sathyanarayanan wrote:
>> + Dan Middleton
>>
>> Hi Boris,
>>
>> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
>>> IOCTL based interface was the natural choice for interacting with the
>>> quote generation machine at a time when there wasn't anything better.
>>> Fortunately, now we have a vendor-agnostic, configfs-based one which
>>> obviates the need to have the IOCTL-based interface.
>>>
>>> Gate the relevant code behind a Kconfig option, clearly marking it as
>>> deprecated as well as introduce a runtime warning.
>>>
>>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
>>> ---
>> In the following thread, Dan Middleton raised a point about this interface
>> being used for local attestation use cases.
>>
>> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
>>
>> Currently, the configfs-based ABI does not support the local attestation use cases.
> What are local attestation use cases, and what happens if Linux does not
> provide a local attestation interface and standardizes on remotely
> attestable as the standard?


Local attestation is used by one TD on the same platform to prove to another TD
in the same platform about its identity. It is mainly used in cases where a TD provides
some special services required by other TDs. Since they are all in the same platform,
there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
to check the correctness of the TD.

I am not sure about actual local attestation users. May be Dan can share that info.

Regarding your question about using "remotely attestable as the standard", I think
remote attestation can handle all local attestation use cases. But, does it make sense to
force users to run a Quoting service if they don't need to communicate with 3rd party
servers?

SGX also seems to have local attestation concept

https://sgx101.gitbook.io/sgx101/sgx-bootstrap/attestation/inter-process-local-attestation

>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

