Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274857;
	b=s5oxgDL6lEJMXHwoSL7mrQH+jah0Aapzkbwp4BfkdlANjlywrd79GT9xkMge+jLGbjoJ
	 zwVqi59IM8NKKWPjM5xaxMDh34nUeIXtYI53uxKdf0s7t8PF+gSA4wnwRh8eZegRTJz6q
	 D4+galga5mGdQ/y9fXZSrZac12G4xRrW0PCWWCZnFwm99+moeIH7fJbAGNIGCHkOa+gOZ
	 ysweGalQA8KIWBTRmxiRSo7KFhdb/dAMGJ5Y/tL4NbHiCmkL0jexlL54dF/t/HmJoUxTP
	 /IMXNhjBlfo0XVHH3Lsald3gKzVr4HUJorK/A2QmB8DVv7XBgJ7DAgcjeR+C4/K3cjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dxQpqtJYLtd33ZhqZ4vr4VxPvRE4072PGKfxqz3W8ro=;
	b=4074EtCupjGUBQE9VdUrDgbMDUSYEsLDd+IBm7WzcL4OJAqjgz11kF3XOy1sdzEQY50e
	 LND7VB5B73eSv5Ug/BChE/MARHQHp5E/jb5Ny0E2kGtEAqxSQF59HoyGGaNmwj5XiUV5f
	 BdEcYYZ4f3sELlBUtkCZRDkzN9VBjbvHZ2jvlTYxJndYN3TEFHOkOeMNZsJJe0xIVRZEP
	 287adtmmEBaxHw9ziAzxWTi8mMkYo1bmqrsNJWrK9Qe11oET8+ufRUWF+nBWnCxDv2U2y
	 4D3gWmm5MDaAZDBFCfs/R6Z/gee9ePPCtV3A9IocJAybnV9BbUaGxeEpA9UV125KG9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VZlmjj7/";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E60606A325
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 01:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E60606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZlmjj7/
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2478931eec.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 17:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274856; x=1794879656; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxQpqtJYLtd33ZhqZ4vr4VxPvRE4072PGKfxqz3W8ro=;
        b=VZlmjj7//3KedmIw4WMsSsfoAb1juxgvnvNXsoQkYatlj+atK3+/DkGTcL/Zg4L/fj
         CfVQECPv9X5UJw/IM0yAFqe8t04M9BIDwfF3wb5RwiPk55y1WzyeQFvGhpBrGtDaIf7Q
         j8LJAhcqAmCVeWCOxm96TZOivAfgm/D2y9u0tMwQa8acP8vPIW1LWn9CUg4pb23GPu7k
         1+X+vwPcOd18p75VnN620RNwyAz0PpDVx7Zd+wNQL16XHvZyslO9TNOXkU7XZaznuuY+
         ECP+QGTw3v4bkm3iPt+QrovGAXPaZfH4Qa8mz4X+boDnEZOIgRJg0Hd7XmZlcULGpmgW
         q6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274856; x=1794879656;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxQpqtJYLtd33ZhqZ4vr4VxPvRE4072PGKfxqz3W8ro=;
        b=bwXTsyXOfUN8KyTi/FmwKS7zrd+FK1zuXeWtDN6Yy51kZ6ZpUUbgC65ICIsWOpV4v2
         OiJm6IGiqMs3hK0VD3gqLlftGnQWTDTU7FjMnjfM8EAvPcKUXoYndoqzVVI5Y4FaOCIy
         rM1H+TaBou7inn/KKlHAO98ojyefdaOTj1cbAb+cmRb64MAT4NRhFHfvzNKu37/UfmaP
         BN2PNMTj6kryCBGVgsFmMV7SYUyOnANmaOP7AzmisvN4qeMum3V+okrFemsrfZIaL+qK
         5NV5P0pElZD1pep6uZcxhYfGvuVyGlzrB+86a3s7e7sEVo8quJpZ3Vl+XSlfgN7cV9EI
         fIig==
X-Forwarded-Encrypted: i=1; AL+hErFwZ2rTn4fHqwvvub5T+INybI0Se7Aw7jRi/jsjMR+GGbEeaIiy3OlNHqvxKivhnYUeH4ppq4Y+dc4H@lists.linux.dev
X-Gm-Message-State: APuU4Z/WSCuZIezIUwxpEmoVRjYVaGaxYARnjdytW2E2GNTy79614rnH
	Hq5S7ED4X1Vq1gIgGHs9ogbOWS1tT7V51jGNbLoUJ6Di4KgdDiALPARvX5iWAw==
X-Gm-Gg: AYBFou0HSU77uXwxM7dgH1EeQ2MHMyJVc6Wfd1O8Ck0adSVCexei5gdlwg5GywcketO
	ZQIgM+ZWHpUk4Op2Nh7HshTP/psW2ZIIgDjfAUJFp631ORN/OHjz9V5nJgBXETsFAVaURQs8GiH
	C05uPBIpGHPUvu+5ZjwPWCMhDOfXVwS+kuYuyAG8erzgpq0QVV316UoUum49kCPhG1AWETdocRB
	ldLlideL01yVwi5sJ2Ql9VQzjhmn5tlb1yAWYZBUuQ4Z7NPEI6Z9CwHUy+eucbdus17SpEe3rVc
	vY3Q3eIz7DzY+/9dSpuB6VKmRrCK7uVOxarOo87O5UHzr27f4eTBkVvsWXhEU3yt/cA9hK+oxT5
	WZay7IL0jdaxh9Ne7+4iPBcYw2uvW24nB1UHhmzzcPq1Ez5Ex1LQqVDItaSMSoEmT5VezFftiy/
	h83HJDd9P3UPaMbdhVRSdMsqzVu4waDi25eC5l7voni/JvcCY4rLY6abS++lkXEGQa0nj6aKnOZ
	UZ5EEG+gqLTqaCX/BwgGKIEuHuUQyn8/6POCsEIwpV5f0c13anuTNgza9HooK8NJ45NfEmjxWNz
	jDDvu+3Hg4QBBZ76E+8LhGhrckUqCrRkoqyZ2EcDoW1ztgVRZH8Udg7/K9XfwxploLLWC7Yl
X-Received: by 2002:a05:693c:864c:20b0:36e:4aaf:6c7b with SMTP id 5a478bee46e88-37520320156mr1500399eec.39.1794274855953;
        Mon, 09 Nov 2026 17:40:55 -0800 (PST)
Received: from ?IPV6:2403:581e:fdf9:0:13b2:851f:d9cb:44c5? ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm2128604eec.3.2026.11.09.17.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:40:55 -0800 (PST)
Message-ID: <4765e562-8c58-4e0f-89f4-eec23b5ef102@gmail.com>
Date: Tue, 10 Nov 2026 11:40:46 +1000
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
Subject: Re: [RFC PATCH v1 10/11] virt: coco: arm-cca-host: Publish slot zero
 and establish streams after acceptance
To: Jason Gunthorpe <jgg@nvidia.com>, Dave Jiang <dave.jiang@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Jiri Pirko <jiri@resnulli.us>, "Tian, Kevin" <kevin.tian@intel.com>,
 Alexey Kardashevskiy <aik@amd.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Steven Price <steven.price@arm.com>, Kiryl Shutsemau <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Jonathan Cameron <jic23@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>
References: <20261103151643.GI274202@nvidia.com>
 <aurmtTe4ObBQhC4S@yilunxu-OptiPlex-7050>
 <DS4PPFA84FA90FCDC94900C2FC6CEF4D428E7682@DS4PPFA84FA90FC.namprd11.prod.outlook.com>
 <20261104134119.GR274202@nvidia.com>
 <a3f95140-c49f-42fc-b92c-73c8cf98336d@intel.com>
 <e05a71df-3b20-45a3-bb46-fb1bdad164c8@intel.com>
 <20261106193018.GK770409@nvidia.com>
 <53bc57bf-1ee1-407a-b48b-bc6b2deee12a@intel.com>
 <20261108183337.GL770409@nvidia.com>
 <2b89b830-f1e4-4304-93ee-40287a4b5b2d@intel.com>
 <20261109185315.GS770409@nvidia.com>
Content-Language: en-US
From: Alistair <alistair23@gmail.com>
In-Reply-To: <20261109185315.GS770409@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 04:53, Jason Gunthorpe wrote:
> On Mon, Nov 09, 2026 at 10:37:14AM -0700, Dave Jiang wrote:
> 
>> One thing on TDX is that TDH.SPDM.CONNECT also runs a
>> GET_MEASUREMENTS of its own during the connect, and the kernel
>> doesn't choose its nonce. The kernel wouldn't hand that one to
>> userspace. Measurements only come out through the two flows, with a
>> user nonce.
> 
> Why? Seems like another wasted operation..
> 
>> That works for TDX. tdx-host's relay is one function today. It takes
>> the module's request from a page shared with the module and calls
>> pci_tsm_doe_transfer(), so att_spdm_doe_exchange() drops in there.
> 
> Yeah, it looks like it works for everyone.

Jason just pointed out this thread, I've tried to pickup what the 
discussion is currently up to, hopefully I've understood it all.

It sounds like the current thinking is the TSM will issue all of the 
SPDM requests and be in control of the session. The kernel will forward 
those requests to the device and Rust SPDM in the kernel will be used to 
decode the responses.

The TSM will be in charge of slot selection, bank selection and 
algorithm support.

> 
> I sketched out this library, and it is basically half or more of the
> in-kernel SPDM in just a different form. Basically all the reply
> message processing and de-framing abstracted into something a little
> different.

The current Rust SPM implementation has split out the message 
processing, so that should be somewhat easy to reuse. Basically (in 
Rust) you pass in the bytes of an SPDM response, specify what the reply 
is (CHALLENGE_RSP) and you get a nice destructed struct back (or an 
error if it's invalid). It's all called the Validator as it validates 
Untrusted data and returns an SPDM response.

One issue though, is that the Validator expects to be passed the SPDM 
Context struct. It uses this as part of the validation. For example the 
Validator will check the `context.version` negotiated to make sure it 
matches the response. Things like that. So some state is expected.

> 
> So in terms of *net* code needed it seems like very little
> 
> But it brings forward "rust spdm" or something in a new form as a
> pre-condition to do the TSMs. Which is annoying for sure.

The Rust SPDM code is hopefully really close! I'm planning on sending v6 
today or tomorrow. The last remaining issue is just getting the Rust 
bindings all sorted. If there is a big push for it to be merged we might 
be able to speed things up.

Note it doesn't support MULTI_KEY or PQC yet though.

> 
>> I tried a quick version of the capture in a test hack with the TDX
>> Module It rebuilt the VCA, slot 0's chain and
>> KEY_EXCHANGE/KEY_EXCHANGE_RSP from the relayed messages, and the
>> kernel's own check of the KEY_EXCHANGE_RSP signature passed. Agreed
>> it's more of a debugging aid. Two things I encountered:
> 
> So you (AI'd?) something basic up to do the captures and showed that
> indeed the right data comes through and the general notion is OK?
> 
> That's great, it matches what all the analysis points to. I could find
> no blocking issue on this idea.
> 
>> - The DOE payloads carry dword padding, so the capture has to trim
>>    each message to its SPDM length before hashing. KEY_EXCHANGE was
>>    160 bytes as a DOE payload and 158 as an SPDM message.
> 
> Yeah, I couldn't belive it when my AI pointed to this. Nobody thought
> to preserve an actual length so any SPDM over DOE implementation needs
> to be very, very painfully calculate a length from the message content
> and algorith negotiation.

Yep, no length information. You have to decode the entire packet...

> 
> My AI predicts 1000-2000 lines of code very careful spec derived code
> just to remove this padding. Such a big spec mistake.
> 
>> - The chain hash in the KEY_EXCHANGE_RSP transcript is over the
>>    whole SPDM chain structure (length, reserved, root hash,
>>    certificates), not just the DER certificates. That's how the
>>    device and the TDX Module compute it.
> 
> Definitely, it would need to capture the certificate stuff in just the
> right way.
> 
> The optional chunking features are a bit tricky, but I don't think a
> 1.2 only implementation needs them. They seem necesary for future
> post-quantum.

Maybe for PQC, but generally this doesn't seem to come up much with DOE. 
So for now it should be fine.

> 
> This also formalizes the version locking: the TSM FW cannot use a SPDM
> version that the kernel does not understand. I think this was already
> basically true, trying to do the 1.3 multi-slot flow is not going to
> work out with out kernel support to move the additional data. Maybe
> nobody noticed, but with this scheme it would be really formal.

The kernel patches support 1.0 - 1.4, so that should be fine.

The issue will be the capabilities (like MULTI_KEY) that aren't 
supported, yet.

One other thing, the current Rust kernel code assumes it's issuing the 
requests, so if a responder uses a capability we don't support, that's 
an error. If the TSM is issuing the requests then we will want to be a 
little more graceful in handling capabilities. Not too hard, just 
something to do.

> 
> In practice this means all the TSMs will need the kernel to tell it
> what SPDM versions it can go up to.
> 
> So I'm a little bit stuck here. Some thoughts:
> 
> 1) I think this removes alot of code from the TSM drivers. All this
>     stuff they have to go back and get the data after the fact, or the
>     thing that is almost like this in RMM, goes away. The TSM drivers
>     are very slim, just run their communicate loops.
> 2) Clear uniform path to 1.3, stop after GET_DIGESTS, let userspace
>     inspect the certificates, continue with the slot. Again drivers can
>     be super simple, just need to pause at the right point in the
>     sequence.
> 3) The data collected and presented to userspace is perfectly uniform
>     governed only by the SPDM specification. There is a clear path to
>     adopt newer versions in the kernel with in-kernel SPDM that
>     instantly with nearly no-code works with all the TSM drivers.
> 4) This is about half of in-kernel SPDM, the receive buffer
>     reassembly, certificate chain reassembly, x509, padding stripping.

That's mostly what the current patches implement as well, so once merged 
you should get most of that working (see the above points)

>     Each a complicated topic on its own. We always imagined having
>     in-kernel SPDM, so I view this as effectively free code - contigent
>     on organizing the in-kernel SPDM implementation in a properly
>     modular way.

That might require some changes, but I don't think is impossible.

> 5) Without AI this looks actually fairly scary. I can see why people
>     wanted to avoid it with different schemes to have the TSM do some
>     of the work. Yet we planned to do it anyhow for in-kernel SPDM so..
> 6) With AI this is probably a weeks work I suppose to really expertly
>     polish and make excellent tests.
> 7) There is clear overlap with Alistair's work, I don't have a sense
>     right now how close some of the parts in that series are to fitting
>     this shape.
> 
> I will look more closely at Alistair's series to see how close it is
> already.

Again, see above

> 
> But, I am strongly tempted to make a draft placeholder in C with AI as
> a way to get alignment and try it out. Something we can throw out if a
> Rust version comes along.

I would argue that you would be better spending that effort on making 
changes to the Rust code and re-use that. That at least would make sure 
it can be adjusted to do what you want and would be more useful :)

Alistair

> 
> Jason

