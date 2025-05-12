Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4212AD0B
	for <linux-coco@lists.linux.dev>; Mon, 12 May 2025 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066892; cv=none; b=k2u7ADYWfpaUAL/Ft9nMEeR5nJQ6oYN0xchd8Vpo1kV/eg4EwM4Clxq9/yZKl5Fgh206SHHSspEAyt1pRQe3tWHOT22fsJTFPOjfDSdGKylrBUu73shR5E+lCH+qrrJV3mGmlkNLCjOPsceLVaSHJJp3vv+lQ09F+W0luZK+050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066892; c=relaxed/simple;
	bh=R916CkDIv6piiy5jUfAa8DNdpHhmJPe/JfXTOj/3U20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhHjwnZRnlTNQZyqzzULyxNgwhLYk4np17BXqPeMDarzTkQ84kght57UihmZhcK0M/itJeDfJLfs/8PzKsoRhBir8pqF/EZA6FpZ/RP27DwfSgyd0aAMXNhpqTd/HGPYnLY23O4V7r94RUKBp0NOeU4SORo0+zY7du6DMPvbCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ioc1Jifq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioc1Jifq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747066891; x=1778602891;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R916CkDIv6piiy5jUfAa8DNdpHhmJPe/JfXTOj/3U20=;
  b=ioc1JifqX1V/OMdaelYwCcJeYFMh59O0GkBGX+bUsjzOM3S22jojGWNO
   OxHY8i461nxiNVMuxlbMYdkLa4pV1QFhoVCarPPoICd16a6lUJd5rWeeC
   6iY2exs/FoN+7sQn1WbJjJy4IFTgG6GMLgnFzkuPxbQfVO2c9aqtAySMQ
   X0sFxv42bw32bByFQ0j/Du1OgtBf+/g+BcDqrjpGQ4LSZ/QFm6IHp0Ae2
   PKAfYp0DETsComysAfMRhoDvWSqvkSFQDokTBtXEMUhIpzOO0ShvSx6lf
   YXgThubCIbky6LEx889gMwUxPZB9JDOpar/13i6W3c55HISzq1/VDZY2m
   w==;
X-CSE-ConnectionGUID: HGvpzGP9RtGGaClyU1RRBw==
X-CSE-MsgGUID: oJvw8hH5QNmZBoHcqqxblQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60216092"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="60216092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 09:21:30 -0700
X-CSE-ConnectionGUID: HOAPRbhcQ1qIAnwOKnGXKw==
X-CSE-MsgGUID: E8xklg7lQ0anqgI3T9lyQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="168496095"
Received: from rrajasre-mobl.amr.corp.intel.com (HELO [10.95.0.74]) ([10.95.0.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 09:21:24 -0700
Message-ID: <3d9fa17e-2b74-4c90-99b8-5b1dc8d15356@linux.intel.com>
Date: Mon, 12 May 2025 11:21:00 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux kernel SIG meeting for vwfwupdate discussion
To: Dionna Amalie Glaze <dionnaglaze@google.com>,
 Steve Rutherford <srutherford@google.com>, linux-coco@lists.linux.dev
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Joerg Roedel <jroedel@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Jon Lange <jlange@microsoft.com>, "cho@microsoft.com" <cho@microsoft.com>,
 Alexander Graf <graf@amazon.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
References: <CAAH4kHZ2yO3ju_iJinR9y4BDXXdWBnEP1wcv09JWMzaqp1ZP+g@mail.gmail.com>
 <CAK3XEhOs4ijnbqmv8UrNmKN4=nv6+_A7fESLibGBRR9u8rXi6w@mail.gmail.com>
 <87frifm75c.fsf@redhat.com>
 <CABayD+eRjjknqJNRkkh9_KraC-jZyXb1BL_D79m04po1_hR-_g@mail.gmail.com>
 <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
Content-Language: en-US
From: Dan Middleton <dan.middleton@linux.intel.com>
In-Reply-To: <CAAH4kHbCduQr_+oj0X8QeTjgDgh6aBncPV-1+mvB_r1R3i7Lqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The recording is now available:
https://www.youtube.com/watch?v=bio5BGhjui4

Additional Minutes:
https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0#heading=h.4qh5zyiozbow 


Really interesting discussion.
Great that the discussion could be recruited on short notice.
Sounds like follow-up might be over a thread here, with those not
subscribed to linux-coco added directly.

Keep in mind that the next SIG session is available and you can not only
show pictures there, but can gesture and point to the same things to
clarify.. I don't understand this stage, this widget, this format.

Thanks,
Dan

On 5/8/25 12:29 PM, Dionna Amalie Glaze wrote:
> Thanks everyone who could attend the CCC Linux Kernel SIG meeting
> about FUKI and specifically the firmware replacement mechanism.
> Please +cc any participants I missed.
> 
> Meeting minutes:
> * the concept from its initial version that was Qemu-specific and used
> specially-named FwCfg files to direct CVM context reconstruction with
> a different ROM.
> * the viewpoint of generalizing that interface to be an IGVM-based
> firmware loading instruction in order to reduce the interface's
> interpretation requirements to keep focused on an emerging standard.
> * the usefulness of "single artifact" VM template distribution, such
> that the firmware can be disk-image specific and not need extra
> orchestration to lead to VM construction.
> * constraints of the different VMM providers, namely
>     + AWS does not have access to guest resources. A disk can only be
> read by a guest VM.
>     + Azure doesn't have this constraint and does not want to build a
> stage 1 VM just to tear it down to boot a stage 2 VM every cold reset.
> It's far more preferable for the host to have the option to determine
> if an IGVM will be requested to load, in which case it should be
> loaded directly without VM construction.
>     + GCP emulates Qemu devices and could implement the FUKI interface,
> but would prefer to use mechanisms that are standardized through
> professional bodies like the UEFI forum. Faster boots without VM
> reconstruction are also highly desirable.
> 
> Jon requested for Alex to give some more design consideration into a
> mechanism that would satisfy both AWS and Azure's constraints.
> 
> Alex suggested the framework of a solution: mount the guest image,
> search the boot partition for a specially named IGVM file, and launch
> that instead of the CSP's firmware.
> (Dionna notes outside of the meeting that this has the danger of being
> an unsound optimization of directly loading the disk image under the
> CSP firmware for FUKI application to load the IGVM due to no
> requirement that the FUKI application load that specific IGVM file)
> 
> I look forward to our further discussion on how to provide a more
> trustworthy Confidential Computing experience in the Cloud for our
> customers :)
> 
> On Wed, May 7, 2025 at 4:04 PM Steve Rutherford <srutherford@google.com> wrote:
>>
>> Heads up, this meeting is tomorrow, May 8th at 9AM PDT (6PM CEST), if
>> you all are available.
>>
>> On Fri, Apr 11, 2025 at 1:31 AM Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>>>
>>> Ani Sinha <anisinha@redhat.com> writes:
>>>
>>>> Adding Vitaly as well who is also involved in this project from Red Hat.
>>>>
>>>> On Fri, Apr 11, 2025 at 4:46 AM Dionna Amalie Glaze
>>>> <dionnaglaze@google.com> wrote:
>>>>>
>>>>> Hi y'all, my colleague Steve Rutherford runs a monthly special
>>>>> interest group meeting amongst Linux kernel developers under the
>>>>> confidential computing consortium umbrella.
>>>>>
>>>>> The f-UKI concept presented at FOSDEM is a very interesting idea for
>>>>> improving customer trust in cloud confidential VMs without the need
>>>>> for complex control plane resource management for virtual firmware
>>>>> EEPROM.
>>>>>
>>>>> Microsoft has proposed a firmware loading format called IGVM that the
>>>>> Coconut-SVSM project has adopted, and has support in Vanadium
>>>>> (Google's KVM-based VMM), Qemu, and OpenVMM (donated to the CCC).
>>>>>
>>>>> I see Alexander from AWS in the Qemu threads for vmfwupdate, so now
>>>>> that's at least the top 3 CSPs represented here.
>>>>>
>>>>> I think for everyone in the To: tag here, we all have a vested
>>>>> interest in improving the CVM trust story without making the
>>>>> virtualization ecosystem even more challenging to work with. I'd like
>>>>> to invite you all to our next meeting
>>>>>
>>>>> 9am PDT May 8th: https://confidentialcomputing.io/get-involved/calendar/
>>>>>
>>>
>>> Hi Ani, Dionna, everyone,
>>>
>>> I'd be delighted to participate! May, 8th, however, is a public holiday
>>> in some European countries including CZ where I'm based and I will be
>>> traveling on that day so I may not be able to join. I'm, however, pretty
>>> certain that Ani/Alex/Gerd can represent the idea very well)
>>>
>>> --
>>> Vitaly
>>>
> 
> 
> 
