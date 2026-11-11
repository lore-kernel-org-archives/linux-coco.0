Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384254;
	b=FqvEnYjmlpKAaHQb+QtvXGc0Rw1a7nsXND1HkNaxVLUGN+n3jVmJeb/L6HL5RiQ3/+zq
	 fACyvj7VdYLyM5HOu5zViUWmGYq1unBygm4Kxrkgey1sSiD4XXrclqAE2PNgTrm/DVJhy
	 GeAXejJenQnQP9kvHolHBqTI1BoOIdcmdliupz+2Kli+jz3Sa7EbL7SWXz7rPBUA5ugrt
	 4vKovQNfD9k+F4ii/8SAyHsaU8L6AD6zsy0vkopWXMzqdAC5CqOIvjVpatC2QvKtM6kIJ
	 iBfPwrtEogfHbkGFdUHKvFJMo38mU/mYOhdKBrR/3Di5cRG4OujpOxOqxpozYtnIxxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6ZX9xvQWpUVBtKirtXVOPyYer8VApveUOjqJsL69dxI=;
	b=qVgs3XSzzilEzV/bJlBWrYr9gBhwSYAm/8WLIu7tHSpG4IUkS6QqrnFhYzgNjq/cZfF1
	 rTLgLs38wQu16cnUpEhqW5BJi4QPm95WDiID9YCLgAdbMqYMDzcd2AhMsB3HCvn5b/9dg
	 s7VqCTtNvBXaWp5ivxXbD5fGF1iM72OqJ0EWOasq4IGZiHiM6++XP+8PsBE878BHqIAQV
	 qjRPve7v1RVihIpNZL2K2OPWkgZefuGtvmsrS+7oP1GsS/mobdyId4S7+lPkPFACFoH0w
	 Msgx0tlMYwD8UGohlfOVJj6Vj8odWhXmLle/UK7A2P0OyiBZscEq97cNMCwRMpowaSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL6nEIr1;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB584606A327
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 08:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB584606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL6nEIr1
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1889426f8f.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 00:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794384252; x=1794989052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ZX9xvQWpUVBtKirtXVOPyYer8VApveUOjqJsL69dxI=;
        b=HL6nEIr1vhtJpJZ+UOQracbNndbf7X78bcBsPGos+A2O17CbXsbsea6BEXiUAR5OjR
         ek49RknmM5PXMNtm3GJS+xXxExsYYI/jyZ0RaFnElrRUrdwIeNuivfGiXUN0VC4ftGVc
         h9pxm6/eUWE+D7URzX90Avpzk0D3IwTFsFLaqWXbRzfQUe+rzkpmnBldZJ0cGfmc62Ph
         RGhSqC9mlW69LAC/25YZouGdtRykMPSZIfl9t63bAAr/ohbPm7piAe5fESl0PTn8xcvB
         DmAOf43kslHO/gMv56ePcXR7Gc4JpKEH98CLcVgQMEbpMuLbGSRx2h/xioAFD99Y88JP
         pRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384252; x=1794989052;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ZX9xvQWpUVBtKirtXVOPyYer8VApveUOjqJsL69dxI=;
        b=pMc4eIa6IB3qW7lspcH9k7d+uMbIdJf9IljZJLtOa73isupllXK1EcgrL4gnBJ5bts
         UB8pF/DAw3KvNuJGxl7na2y3gYvfhk8t5Kv0dhTqFKPbM4/zQvjodkCxN2VEblRl8Dag
         d9sL4dEjJGvO58fm1uvZaqtZTP9luagU8pCcm1OGPlZlBbpAc2XBYFHfZSf/6wCC/U5G
         xsh3DDc3sljZo9UWW9gL8ZoRZ1Zbzh8vjNFwc6GYOdtAM/b4BrvijVCqvcs2v1OK5+vQ
         1GXX4+ZYn5zyejSQqU3oB+Nse9Iba2L+y5szBACovUHJg1XJJu7nuFqo/Q7G0yA1FCCG
         oJ4g==
X-Forwarded-Encrypted: i=1; AL+hErE9T2XicqpFYITRy1xG9rqI4RuurNnSOwtkJ4XfZ34a6Qzm76mHKM7J7oHBKk7VXIbecGm8ynKTB+cm@lists.linux.dev
X-Gm-Message-State: APuU4Z84D5e7Iyt/hPGQnIS6BYpymnNIYshY+OosGBUh1H81jA41Q+Od
	oBnfZXjRyz24l9f6yBBKaZbY4bwnqjcV0xoJCD4R7iswJ7AFqV0QZoWFul50wW9P79g=
X-Gm-Gg: AYBFou0m4mtqM9iqwSKprpYWywig8N38V/XkjUiDqajtgvpYGuS46ejOIEgJPBGom0U
	58kIE1ripPHM3dCHCec4wLK0RNKAMaX6o+RbnqIAJFNggz8SaVYctVgMtTLRsTBAtaugFqc4jzi
	nk2x7J27sI3pXGOQT1FJLwInvrk4zC7FE3oJ0UKr1BCkBcrOkVQTrtxSSe9yl13jZXorqrt/ySy
	sOu+zu/LBvVEAMLtyc4uKlpHO5KSJZ9GuS9lGVRZPVro296cmbv6SVQ7Nxa2K5PUJXaQEHX8kSd
	04RES2m2cAKidvlQEzeokijj68Tz5LMi5GbllfaNg5rbrOmIjB7GryMP20UxfOe/HekC/wXRyzg
	/rL3jvr7dg0nYhGcG1v3Dx3MnJ2O3ZP/sqjLAvRlsdBBBeE3Kt20DOfRFlFz9jlEwkJg2ojrIDi
	3SFxPTOv+aDFPw7lY0sNw3WKefXoxOdaQVMgTJUnhQcfZaAmfvC52zt5UEyXc7XQvhyiciAaYNq
	oyFzdn6zymkaDuMyCVdy57TLQYX1wLoeo9n9v6ngwOw9fgEhM/9ipIv93jH96b5w8uPYOB3ciQj
	lalN4Z3VkUVLxLwEYURS4F3tzBM8p/Ca
X-Received: by 2002:a05:600c:19d0:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4ba09375b5amr24148075e9.11.1794384251894;
        Wed, 11 Nov 2026 00:04:11 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm193932935e9.11.2026.11.11.00.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:04:11 -0800 (PST)
Message-ID: <03a36011-eddf-4d89-9d86-1cc3998f89c3@suse.com>
Date: Wed, 11 Nov 2026 10:04:09 +0200
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "Hansen, Dave" <dave.hansen@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "Peng, Chao P"
 <chao.p.peng@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "Verma, Vishal L" <vishal.l.verma@intel.com>, "hpa@zytor.com"
 <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Gao, Chao"
 <chao.gao@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "aik@amd.com" <aik@amd.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10.11.26 г. 11:40 ч., Duan, Zhenzhong wrote:
> 
> 
>> -----Original Message-----
>> From: Edgecombe, Rick P <rick.p.edgecombe@intel.com>
>> Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
>> operations
>>
>> On Tue, 2026-11-03 at 08:49 +0000, Duan, Zhenzhong wrote:
>>>
>>>> -----Original Message-----
>>>> From: Edgecombe, Rick P <rick.p.edgecombe@intel.com>
>>>> On Thu, 2026-10-29 at 03:26 +0000, Duan, Zhenzhong wrote:
>>>>> I want to discuss this further.
>>>>>
>>>>> If the TSM driver successfully locks a device but later fails to
>> unlock
>>>> it,
>>>>
>>>> Can you explain some concrete scenarios where this would happen? We can
>>>> think
>>>> about whether it is required for an initial minimal set that does
>> something
>>>> useful.
>>>
>>> I can think of some rare cases: the TDCM hypercall may return an
>> error(e.g., a messing VMM or TDI device firmware),
>>>
>>
>> I'm not clear whose fault this is.
>>
>>>   or TDCM hypercall polling timeout(e.g., heavy load in host).
>>
>> Heavy load in the host leads to broken flag being set? This is pretty
>> similar to
>> the issues around the BUSY errors. You really need to think through how
>> this is
>> all going to work.
> 
> I found current implementation did not handle a polling timeout well,
> so I reworked it following the GetQuote implementation. The shared buffer
> is now allocated per device instead of per command. After a timeout,
> further commands fail with -EBUSY until the VMM reports the pending
> command complete, and the buffer is leaked only if that command is still
> pending when the device is unlocked.
> 
> Below is the reworked patch that handles polling timeout, I'd like to seek
> comments on this new implementation early, comments welcome!
> 
>      virt: tdx-guest: Add TDCM helper infrastructure
> 
>      Add internal helpers that send TDCM commands to the host and wait for
>      them to complete, using a buffer shared with the VMM. The tdx-guest
>      driver uses them to manage the TDI of an assigned TEE-IO device, for
>      example to bind or unbind it.
> 
>      A TDCM VMCALL acknowledges command submission, but the command may
>      remain pending after it returns. GHCI allows asynchronous completion and
>      defines status polling and event notification as completion methods. A
>      valid notification vector (32-255) enables event notification.

Remove last sentence, this is an implementation detail of the vent 
notification which is not even being used. It's sufficient to say there 
are 2 methods and you've chosen polling and then say *WHY* you have 
chosen it, which you do with the following paragraph.

> 
>      Use status polling instead of event notification. TDCM commands are only
>      issued when a device is locked, unlocked or accepted, which are
>      infrequent administrative operations, so polling adds little overhead
>      and avoids setting up an interrupt vector and its completion handling.

This can be simplified, just say that mechanism is only used during 
setup which is a small part of the whole process and polling has been 
chosen for simplicity, no need to go into detail about interrupt vector 
setting up and what not.

> 
>      After the VMCALL returns, check the shared status and, while the command
>      is still pending, poll it with a sleep of at most 1 ms until a 10-second
>      timeout expires. Each DOE request-response exchange may take up to one
>      second, the limit set by the PCIe specification and used by Linux's DOE
>      code. In testing, BIND used the most exchanges of any TDCM command, at
>      three, so 10 seconds leaves room for those exchanges and additional host
>      processing. This is a guest-side timeout, not a GHCI completion
>      guarantee, and does not bound the time spent in the VMCALL itself.

I find this somewhat way too verbose with implementation detail which 
can be derived from just looking at the code.

> 
>      Converting memory between private and shared is expensive and breaks up
>      large direct-map and EPT mappings. Keep one shared buffer per TDI
>      context: allocate it and convert it to shared when the device is
>      locked, and convert it back and free it when the device is unlocked,
>      rather than converting memory for every command. All TDCM commands for
>      a device run under its device lock, which serializes use of the buffer.

Again, way too many implementation detail. Just say the memory is 
initialized at device lock and freed when you are finished.

> 
>      Only the command helper writes to the buffer. It takes the command data
>      from the caller and copies it in once the VMM no longer owns the buffer.
>      GHCI defines TDCM commands that carry command data, so the helper
>      accepts it even though the commands used initially carry none.
> 
>      Treat the response as VMM-controlled: read its length once, require
>      exactly the expected size for fixed-size responses or at most the
>      caller's maximum otherwise, and leave reading or copying the data to
>      the caller.

Remove this paragraph, it simply restates what the code is doing. The 
gist is that once the TDCM is sent we have to treat the contents of buf 
as coming from an outside party.

> 
>      If a command is still pending at timeout, reject further commands with
>      -EBUSY while the VMM still reports it as pending, as GetQuote does. The
>      VMM may still complete such a command, so its effect is unknown to the
>      guest. The operation that issued it fails, and userspace can retry it
>      by writing the PCI TSM sysfs attribute again, which issues the command
>      again.
> 
>      When the device is unlocked, or locking fails, convert the buffer back
>      to private and free it. If a timed-out command is still pending at that
>      point, leak the buffer instead: the VMM may still write the response,
>      and freed pages can be reused.
> 
>      tdx_tdcm_run() is initially unused. A following patch uses it to
>      execute the TEE-IO support check during device locking.

Those sentence convey no useful information whatsoever, the 
__mabybe_unused in the code, which even gets removed in a feature patch 
already say this.

> 
>      Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> 
>      ---
>      rfcv2:
>          - move TDCM specific declaration into connect.c (Nikolay)
>          - Explain asynchronous completion and polling choice (Nikolay, Xiaoyao)
>          - Use GHCI-style names for TDCM error constants (Xiaoyao)
>          - Split TDCM helpers into a separate patch (Xiaoyao)
>          - Replace cleanup attributes with explicit cleanup paths (Rick, Xiaoyao)
>          - Keep one shared TDCM buffer per device, allocated at lock, and return
>            -EBUSY while a timed-out command is pending; leak the buffer only if
>            that command is still pending at unlock
>          - Check command and response sizes against the buffer at build time
> 
> diff --git a/drivers/virt/coco/tdx-guest/connect.c b/drivers/virt/coco/tdx-guest/connect.c
> index ead245c6b120..70bd68994259 100644
> --- a/drivers/virt/coco/tdx-guest/connect.c
> +++ b/drivers/virt/coco/tdx-guest/connect.c
> @@ -7,15 +7,94 @@
> 
>   #define pr_fmt(fmt)            KBUILD_MODNAME ": tdx_connect: " fmt
> 
> +#include <linux/iopoll.h>
>   #include <linux/pci.h>
>   #include <linux/pci-tsm.h>
> +#include <linux/set_memory.h>
>   #include <linux/tsm.h>
> +#include <linux/units.h>
>   #include <asm/tdx.h>
> 
>   #include "tdx-guest.h"
> 
> +enum tdcm_operation {
> +       TDCM_OP_CHECK_TEEIO_SUPP        = 1,
> +       TDCM_OP_BIND                    = 2,
> +       TDCM_OP_GET_DEV_INFO            = 3,
> +       TDCM_OP_GET_TDI_REPORT          = 4,
> +       TDCM_OP_START_TDI               = 5,
> +       TDCM_OP_GET_TDI_STATE           = 6,
> +       TDCM_OP_UNBIND                  = 7,
> +};
> +
> +enum tdcm_status {
> +       TDCM_STATUS_WAIT                = 0,
> +       TDCM_STATUS_COMPLETED           = 1,
> +       TDCM_STATUS_ERROR               = 2,
> +};
> +
> +enum tdcm_error {
> +       TDCM_TDX_MODULE_ERROR           = 10,
> +       TDCM_TDXIO_DEVICE_ERROR         = 11,
> +       TDCM_SPDM_MESSAGE_ERROR         = 12,
> +       TDCM_IDE_KM_MESSAGE_ERROR       = 13,
> +       TDCM_TDISP_MESSAGE_ERROR        = 14,
> +       TDCM_INVALID_STATE              = 15,
> +};
> +
> +struct tdvmcall_tdcm {
> +       __u16 operation;  /* See enum tdcm_operation */
> +       __u8  version;
> +       __u8  rsvd0;
> +       __u32 rsvd1;
> +
> +       __u8  status;     /* See enum tdcm_status */
> +       __u8  error;      /* See enum tdcm_error */
> +       __u16 rsvd2;
> +       __u32 rsvd3;
> +
> +       __u32 data_length;
> +
> +       __u8  data[];
> +} __packed;
> +
> +/*
> + * Size of the shared TDCM buffer, header included. Commands in this driver
> + * exchange at most a few bytes of data. Grow this if a command needs more,
> + * e.g. for TDI reports.
> + *
> + * Every command and response size passed to tdx_tdcm_run() is a constant
> + * that must fit in TDCM_MAX_DATA_SZ. Check each one with static_assert()
> + * next to its caller.
> + */
> +#define TDCM_BUF_SIZE          PAGE_SIZE
> +#define TDCM_MAX_DATA_SZ       (TDCM_BUF_SIZE - sizeof(struct tdvmcall_tdcm))
> +
> +/*
> + * The DOE response timeout is one second per exchange. Expect that 10 seconds
> + * is enough time for the host to complete a TDCM command.
> + */
> +#define TDCM_POLL_TIMEOUT_US   (10 * USEC_PER_SEC)
> +#define TDCM_POLL_DELAY_US     1000
> +
> +/**
> + * struct tdx_devsec - TDX Connect context for a locked TDI
> + * @pci: PCI TSM devsec context
> + * @tdcm_buf: Buffer shared with the VMM for TDCM commands, TDCM_BUF_SIZE
> + *           bytes. Allocated at lock and freed at unlock, so memory is not
> + *           converted between private and shared on every command. Only
> + *           tdx_tdcm_run() writes to it. Callers may read response data
> + *           after tdx_tdcm_run() returns 0.
> + * @tdcm_in_flight: An earlier command timed out and the VMM may still own
> + *                 @tdcm_buf. Cleared once the VMM reports its completion.
> + *
> + * All TDCM commands for a device run under its device lock, which serializes
> + * use of @tdcm_buf and @tdcm_in_flight.
> + */
>   struct tdx_devsec {
>          struct pci_tsm_devsec pci;
> +       struct tdvmcall_tdcm *tdcm_buf;
> +       bool tdcm_in_flight;
>   };
> 
>   static struct tdx_devsec *to_tdx_devsec(struct pci_tsm *tsm)
> @@ -23,6 +102,155 @@ static struct tdx_devsec *to_tdx_devsec(struct pci_tsm *tsm)
>          return container_of(tsm, struct tdx_devsec, pci.base_tsm);
>   }
> 
> +static struct pci_dev *tdx_devsec_pdev(struct tdx_devsec *tdevsec)
> +{
> +       return tdevsec->pci.base_tsm.pdev;
> +}
> +
> +static int tdx_tdcm_buf_alloc(struct tdx_devsec *tdevsec)
> +{
> +       struct tdvmcall_tdcm *buf;
> +
> +       buf = alloc_pages_exact(TDCM_BUF_SIZE, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       if (set_memory_decrypted((unsigned long)buf, PHYS_PFN(TDCM_BUF_SIZE))) {
> +               pci_err(tdx_devsec_pdev(tdevsec),
> +                       "Failed to convert TDCM buffer to shared, leaking it\n");
> +               return -EIO;
> +       }
> +
> +       tdevsec->tdcm_buf = buf;
> +       return 0;
> +}
> +
> +static void tdx_tdcm_buf_free(struct tdx_devsec *tdevsec)
> +{
> +       struct tdvmcall_tdcm *buf = tdevsec->tdcm_buf;
> +
> +       if (!buf)
> +               return;
> +
> +       tdevsec->tdcm_buf = NULL;
> +
> +       /*
> +        * A timed-out command may still be pending in the VMM. Leak the
> +        * buffer so a late response cannot land in the pages after they
> +        * are reused.
> +        */
> +       if (tdevsec->tdcm_in_flight &&
> +           READ_ONCE(buf->status) == TDCM_STATUS_WAIT) {

Is the read_once even needed in here?

> +               pci_warn(tdx_devsec_pdev(tdevsec),
> +                        "TDCM command still pending, leaking TDCM buffer\n");
> +               return;
> +       }
> +
> +       if (set_memory_encrypted((unsigned long)buf, PHYS_PFN(TDCM_BUF_SIZE))) {
> +               pci_err(tdx_devsec_pdev(tdevsec),
> +                       "Failed to convert TDCM buffer to private, leaking it\n");
> +               return;
> +       }
> +
> +       free_pages_exact(buf, TDCM_BUF_SIZE);
> +}
> +
> +/**
> + * tdx_tdcm_run() - Execute a TDCM command and wait for its completion
> + * @tdevsec: TDI context
> + * @operation: TDCM operation, see enum tdcm_operation
> + * @cmd_data: Command data to send, or NULL
> + * @cmd_data_sz: Size of @cmd_data in bytes, 0 for none
> + * @max_rsp_data_sz: Response data size, or the largest accepted if
> + *                  @rsp_data_sz is given. 0 for no response data.
> + * @rsp_data_sz: NULL for a fixed-size response, which must be exactly
> + *              @max_rsp_data_sz bytes. Otherwise accept 1 to
> + *              @max_rsp_data_sz bytes and return the size here.
> + *
> + * Copy @cmd_data into the shared buffer only once the VMM no longer owns it.
> + * On success, response data is at tdevsec->tdcm_buf->data. It is VMM-written:
> + * read it once or copy it out, before the next TDCM command reuses the buffer.
> + *
> + * Return: 0 on success, -EBUSY if an earlier timed-out command is still
> + * pending in the VMM, or another negative errno on failure.
> + */
> +static int __maybe_unused tdx_tdcm_run(struct tdx_devsec *tdevsec,
> +                                      u16 operation, const void *cmd_data,
> +                                      u32 cmd_data_sz, u32 max_rsp_data_sz,
> +                                      u32 *rsp_data_sz)
> +{
> +       struct pci_dev *pdev = tdx_devsec_pdev(tdevsec);
> +       struct tdvmcall_tdcm *buf = tdevsec->tdcm_buf;
> +       bool bad_len;
> +       u32 data_len;
> +       u8 status;
> +       int ret;
> +       u64 r;
> +
> +       /*
> +        * After a timeout the VMM may still be processing the earlier command
> +        * and writing its response. Don't touch the buffer until it is done,
> +        * as GetQuote does.
> +        */
> +       if (tdevsec->tdcm_in_flight) {
> +               if (READ_ONCE(buf->status) == TDCM_STATUS_WAIT)

Is it even needed in here, you don't poll on it to assume adjacent reads 
might be merged?

> +                       return -EBUSY;
> +               tdevsec->tdcm_in_flight = false;
> +       }
> +
> +       /*
> +        * Stale response data from an earlier command is VMM-written and never
> +        * trusted, so only the header needs resetting.
> +        */
> +       memset(buf, 0, sizeof(*buf));
> +       buf->operation = operation;
> +       buf->status = TDCM_STATUS_WAIT;
> +       buf->data_length = cmd_data_sz;
> +       if (cmd_data_sz)
> +               memcpy(buf->data, cmd_data, cmd_data_sz);
> +
> +       r = tdx_hcall_tdcm(pdev, virt_to_page(buf), TDCM_BUF_SIZE >> PAGE_SHIFT);
> +       if (r) {
> +               pci_err(pdev, "TDCM command %u submission failed: 0x%llx\n",
> +                       operation, r);
> +               return -EIO;
> +       }
> +
> +       ret = read_poll_timeout(READ_ONCE, status, status != TDCM_STATUS_WAIT,
Is it even needed in here as well, while you do poll it's in a fresh 
function call?

> +                               TDCM_POLL_DELAY_US, TDCM_POLL_TIMEOUT_US, false,
> +                               buf->status);
> +       if (ret) {
> +               /* The next command fails with -EBUSY until the VMM is done */
> +               tdevsec->tdcm_in_flight = true;
> +               pci_err(pdev, "TDCM command %u timed out\n", operation);
> +               return ret;
> +       }
> +
> +       /* Ensure subsequent data reads are ordered after the status observation */
> +       virt_rmb();
> +
> +       /* Read the VMM-controlled length once, then validate the cached copy */

nit: Pointless comment, it's obvious from the code what's going on.

> +       data_len = READ_ONCE(buf->data_length);
> +
> +       if (rsp_data_sz)
> +               bad_len = !data_len || data_len > max_rsp_data_sz;
> +       else
> +               bad_len = data_len != max_rsp_data_sz;
> +
> +       if (status != TDCM_STATUS_COMPLETED || bad_len) {
> +               pci_err(pdev,
> +                       "TDCM command %u failed: status 0x%x, error 0x%x, max_rsp_data_sz 0x%x, returned 0x%x\n",
> +                       operation, status, READ_ONCE(buf->error),
> +                       max_rsp_data_sz, data_len);
> +               return -EIO;
> +       }
> +
> +       if (rsp_data_sz)
> +               *rsp_data_sz = data_len;
> +
> +       return 0;
> +}
> +

<snip>

