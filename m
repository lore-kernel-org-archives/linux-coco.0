Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A7263A9
	for <linux-coco@lists.linux.dev>; Sat, 17 Jun 2023 17:43:32 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b45e6e1b73so18638381fa.0
        for <linux-coco@lists.linux.dev>; Sat, 17 Jun 2023 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1687023810; x=1689615810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D50VGgU/sXnu2NEZo1e0m4DmfDgTUbfLcCx+euCMa+0=;
        b=Y02vhee/Tvh0dg0LmrVaophgEtwLb0XCL12duH/pmlgW/Aaze2xe+/Q2Y1bXuh9fge
         Et4hjN+p/gZv5Cv9ed9d2fvbnOQVFUEOGl+u3pGdYBbOl2nomgRVQB+4mje5FMr8OUNP
         3oeQV12ek15TaN8W/5oJEXA/jUVuG82PzOTWr/YCOfQfZVjGG1sW8MMF8s1Bty0uELvm
         ONgn0IhL7opAheBXYyqeSQgLchSUsMLgpaQ+ZtGhfQLJztqkb9jVrwz7c8Ix03/D/xcH
         T9ikCwA+v24ERw8H5iRs1wLLzawTIY6Dai0177mbEN7Ud1mSp1roBymj7A+mVm+MsevB
         I4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687023810; x=1689615810;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D50VGgU/sXnu2NEZo1e0m4DmfDgTUbfLcCx+euCMa+0=;
        b=EN3hSdWEp0oNTtGAlaoAXi/g9AyRKG5HHNpUJNYL90B9hCdrwBK9oraJXae1bfiR8a
         AYpzlmpkJLsnvJf0hLLKFVs2P3Oa+h5WEHQ94kTWiILvpCKtnXO7GjTbQcUH4coAdyz4
         hBk8MXMZSdJm8unj55A86eUV7jfT5UjNBFwqTv4JUbXkzhDdUKNiZAzupWynBx+V4i9T
         otmLeol/LViPUJovN7UfqIM4FF+A1VauOnr2IPrQW0PZ4+kdjsyJB5dto/0eOWEBlTSI
         H4gikfFTtQtBGJJZPILQCrehw/9bjTnuDNYMqOeCM5cmkyXTTvB9qyiKtlNYzriRE8be
         Fsvw==
X-Gm-Message-State: AC+VfDxPU3Gchc8C7UOiVs0lSg4UKuFKxNbB0L3REpMWp+K7MkAhf/ip
	f2+R/yAiJS8hwBvYex/daIuQhQ==
X-Google-Smtp-Source: ACHHUZ7Gg5Sfz2W0QMUJZ9txrmfZIgZSKQ5XppYv5pItyXZPRQkjX4ZUSjl/at6q6+A0A5emsNCg1A==
X-Received: by 2002:a2e:8756:0:b0:2b1:eca3:4e8d with SMTP id q22-20020a2e8756000000b002b1eca34e8dmr3731387ljj.12.1687023809620;
        Sat, 17 Jun 2023 10:43:29 -0700 (PDT)
Received: from ?IPV6:2a02:a31b:2041:8680:1268:c8b0:5fcc:bf13? ([2a02:a31b:2041:8680:1268:c8b0:5fcc:bf13])
        by smtp.gmail.com with ESMTPSA id b9-20020a2e8489000000b002b46723df5esm457135ljh.37.2023.06.17.10.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 10:43:28 -0700 (PDT)
Message-ID: <10b6045e-e5e4-e1f6-f93a-34f1ad61fdfe@semihalf.com>
Date: Sat, 17 Jun 2023 19:43:25 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] docs: security: Confidential computing intro and
 threat model for x86 virtualization
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>,
 Carlos Bilbao <carlos.bilbao@amd.com>,
 Jason CJ Chen <jason.cj.chen@intel.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ardb@kernel.org" <ardb@kernel.org>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>,
 "michael.day@amd.com" <michael.day@amd.com>,
 "pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>,
 "David.Kaplan@amd.com" <David.Kaplan@amd.com>,
 "Reshma.Lal@amd.com" <Reshma.Lal@amd.com>,
 "Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dinechin@redhat.com" <dinechin@redhat.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "berrange@redhat.com" <berrange@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "jikos@kernel.org" <jikos@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
 "leon@kernel.org" <leon@kernel.org>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 "lukas@wunner.de" <lukas@wunner.de>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "cdupontd@redhat.com" <cdupontd@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "sameo@rivosinc.com" <sameo@rivosinc.com>, "bp@alien8.de" <bp@alien8.de>,
 "security@kernel.org" <security@kernel.org>,
 Larry Dewey <larry.dewey@amd.com>, android-kvm@google.com,
 Dmitry Torokhov <dtor@google.com>, Allen Webb <allenwebb@google.com>,
 Tomasz Nowicki <tn@semihalf.com>, Grzegorz Jaszczyk <jaz@semihalf.com>,
 Patryk Duda <pdk@semihalf.com>
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
 <ZIihRqZljMaMRGcK@google.com>
 <DM8PR11MB5750D16B08B769173DCD740AE75AA@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZInLlkXsgnej9ZpT@google.com>
 <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
 <ZIxqAXhy1tCVpzz7@google.com>
 <22438996-cea6-fcdc-530b-bf3f2477a81c@semihalf.com>
 <ZIyk+qIBRD6ezlPo@google.com>
From: Dmytro Maluka <dmy@semihalf.com>
In-Reply-To: <ZIyk+qIBRD6ezlPo@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/23 20:07, Sean Christopherson wrote:
> On Fri, Jun 16, 2023, Dmytro Maluka wrote:
>> On 6/16/23 15:56, Sean Christopherson wrote:
>>> On Fri, Jun 16, 2023, Dmytro Maluka wrote:
>>>> Again, pedantic mode on, I find it difficult to agree with the wording
>>>> that the guest owns "most of" the HW resources it uses. It controls the
>>>> data communication with its hardware device, but other resources (e.g.
>>>> CPU time, interrupts, timers, PCI config space, ACPI) are owned by the
>>>> host and virtualized by it for the guest.
>>>
>>> I wasn't saying that the guest owns most resources, I was saying that the *untrusted*
>>> host does *not* own most resources that are exposed to the guest.  My understanding
>>> is that everything in your list is owned by the trusted hypervisor in the pKVM model.
>>
>> Heh, no. Most of these resources are owned by the untrusted host, that's
>> the point.
> 
> Ah, I was overloading "owned", probably wrongly.  What I'm trying to call out is
> that in pKVM, while the untrusted host can withold resources, it can't subvert
> most of those resources.  Taking scheduling as an example, a pKVM vCPU may be
> migrated to a different pCPU by the untrusted host, but pKVM ensures that it is
> safe to run on the new pCPU, e.g. on Intel, pKVM (presumably) does any necessary
> VMCLEAR, IBPB, INVEPT, etc. to ensure the vCPU doesn't consume stale data.

Yep, agree.
 
>> Basically for two reasons: 1. we want to keep the trusted hypervisor as
>> simple as possible. 2. we don't need availability guarantees.
>>
>> The trusted hypervisor owns only: 2nd-stage MMU, IOMMU, VMCS (or its
>> counterparts on non-Intel), physical PCI config space (merely for
>> controlling a few critical registers like BARs and MSI address
>> registers), perhaps a few more things that don't come to my mind now.
> 
> The "physical PCI config space" is a key difference, and is very relevant to this
> doc (see my response to Allen).

Yeah, thanks for the links and the context, BTW.

But let me clarify that we have 2 things here that should not be
confused with each other. We have 2 levels of virtualization of the PCI
config space in pKVM. The hypervisor traps the host's accesses to the
config space, but mostly it simply passes them through to hardware. Most
importantly, when the host reprograms a BAR, the hypervisor makes sure
to update the corresponding MMIO mappings in the host's and the guest's
2nd-level page tables (that is what makes protection of the protected
guest's passthrough PCI devices possible at all). But essentially it's
the host that manages the physical config space. And the host, in turn,
virtualizes it for the guest, using vfio-pci, like it is traditionally
done for passthrough PCI devices.

This latter, emulated config space is the concern. Looking at the
patches [1] and thinking if those MSI-X misconfiguration attacks are
possible in pKVM, I come to the conclusion that yes, they are.

Device attestation helps with trusting/verifying static information, but
the dynamically changing config space is something different.

So it seems that such "emulated PCI config misconfiguration attacks"
need to be included in the threat model for pKVM as well, i.e. need to
be hardened on the guest side. Unless we revisit our current design
assumptions for device assignment in pKVM on x86 and manage the physical
PCI config in the trusted hypervisor, not in the host (with all the
increasing complexity that comes with that, related to power management
and other things).

Also, thinking more about it: irrespectively of passthrough devices, I
guess that the protected pKVM guest may well want to use virtio with PCI
transport (not for things like networking, but that's not the point),
thus be prone to the same attacks.

>> The untrusted host schedules its guests on physical CPUs (i.e. the
>> host's L1 vCPUs are 1:1 mapped onto pCPUs), while the trusted hypervisor
>> has no scheduling, it only handles vmexits from the host and guests. The
>> untrusted host fully controls the physical interrupt controllers (I
>> think we realize that is not perfectly fine, but here we are), etc.
> 
> Yeah, IRQs are a tough nut to crack.

And BTW, doesn't it mean that interrupts also need to be hardened in the
guest (if we don't want the complexity of interrupt controllers in the
trusted hypervisor)? At least sensitive ones like IPIs, but I guess we
should also consider interrupt-based timings attacks, which could use
any type of interrupt. (I have no idea how to harden either of the two
cases, but I'm no expert.)

[1] https://lore.kernel.org/all/20230119170633.40944-1-alexander.shishkin@linux.intel.com/
