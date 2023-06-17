Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DDA63A9
	for <linux-coco@lists.linux.dev>; Sat, 17 Jun 2023 18:15:33 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so2520241e87.1
        for <linux-coco@lists.linux.dev>; Sat, 17 Jun 2023 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1687025731; x=1689617731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Dsw7nAhARw8huKJiFcVT3g3RXe09FTUVjhq7l/Iznk=;
        b=VWZAosjutRNS4RszthwOli914gKOptEXZa4eZ5SwV/+PgVaATfd/NAwSbwkp2X/B+B
         UsWhfOCT6R3PMY+waiHqFwJOIhbTHpzgA8g5DLs8l8nepobX5nR6l/GBRdrXWwLQyf05
         IzAD3kEWnvQgMNDBM95vGaMOMKgdhRyD5FOqr6sA5WpKr19y0QX9BVSLIY03cDC9oNxH
         8/pRAB1vBtT97ruYFF9PW6Se2JDc1YYWs0dtdypBzTtktYPIbobwAXLH1EYjie2hnvy1
         BosMqAPawNTICw1gO9VUaoE2s/6blYmmoYwx0KoIpv2kUV+VcxxkF7uXkbjsE1m7H0p+
         n22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687025731; x=1689617731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dsw7nAhARw8huKJiFcVT3g3RXe09FTUVjhq7l/Iznk=;
        b=k+YTERAB5/a7AmLo9Xy41PZq60Yq4DujmAvWicm2kqm7DqvhL7Rnms6jIEldrHK8qo
         a02XN8wpa4L2+QGNwwNPe7KW3DrPRx7rtAisWZ10d2Jo2i1yxynpH9au1mcyLINGh7BC
         LF0RyOnQZLH+6KSxNLNLI/8edOeUR5bQtp3kcm60cnKUeWoEtq+n5IjEMpdZCFsjQzPJ
         qT102HxAU0at1+Mj0ZoA9nTWgHxXpOYt5MMIKCj1m5iV/HgCB5vm/vvpwCov1LaX+A/3
         8l2CihPRuckWn1dK6Kt0TikHbIklLPJUrq3vLb20TrPD6wFNsbRgij/bPucnVk6CtHh0
         N0/w==
X-Gm-Message-State: AC+VfDzUP5Xup9vwPZM/xBdpQq8JyZ3JY2LREvdmdz+yHH+Ii23Ngen6
	IordLvdbD7UGAHIZdAgpeD8t6w==
X-Google-Smtp-Source: ACHHUZ6aSxu1poHVXap/a1Nbx1PeH9YaODmzO7ZFGZ7Lsf9tYpTQaaJmZYzW70eLvrIH2lA9NQHnUw==
X-Received: by 2002:a19:5e02:0:b0:4f7:69b9:fa07 with SMTP id s2-20020a195e02000000b004f769b9fa07mr3347470lfb.45.1687025731242;
        Sat, 17 Jun 2023 11:15:31 -0700 (PDT)
Received: from ?IPV6:2a02:a31b:2041:8680:1268:c8b0:5fcc:bf13? ([2a02:a31b:2041:8680:1268:c8b0:5fcc:bf13])
        by smtp.gmail.com with ESMTPSA id v5-20020ac25605000000b004f3b3f5751bsm275240lfd.275.2023.06.17.11.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 11:15:30 -0700 (PDT)
Message-ID: <0fce3bf9-7100-6e4e-297e-32dffc875bcf@semihalf.com>
Date: Sat, 17 Jun 2023 20:15:27 +0200
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
To: Allen Webb <allenwebb@google.com>, Sean Christopherson <seanjc@google.com>
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
 Dmitry Torokhov <dtor@google.com>, Tomasz Nowicki <tn@semihalf.com>,
 Grzegorz Jaszczyk <jaz@semihalf.com>, Patryk Duda <pdk@semihalf.com>
References: <20230612164727.3935657-1-carlos.bilbao@amd.com>
 <ZIihRqZljMaMRGcK@google.com>
 <DM8PR11MB5750D16B08B769173DCD740AE75AA@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ZInLlkXsgnej9ZpT@google.com>
 <001aa2ed-2f78-4361-451d-e31a4d4abaa0@semihalf.com>
 <ZIxqAXhy1tCVpzz7@google.com>
 <CAJzde06TP5D1UAko6tJmdPt-0Ja4cnByWEDF0c6KJ4k__WjODg@mail.gmail.com>
 <ZIx0w/1x7HbmOKYr@google.com>
 <CAJzde04DSeVcMCVTN_3SFUVoKszL1YUbX9eHq6Y0QKtX16xCDA@mail.gmail.com>
From: Dmytro Maluka <dmy@semihalf.com>
In-Reply-To: <CAJzde04DSeVcMCVTN_3SFUVoKszL1YUbX9eHq6Y0QKtX16xCDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/23 17:16, Allen Webb wrote:
> That extra context helps, so the hardening is on the side of the guest
> kernel since the host kernel isn't trusted?
> 
> My biggest concerns would be around situations where devices have
> memory access for things like DMA. In such cases the guest would need
> to be protected from the devices so bounce buffers or some limited
> shared memory might need to be set up to facilitate these devices
> without breaking the goals of pKVM.

I'm assuming you are talking about cases when we want a host-owned
device, e.g. a TPM from your example, to be able to DMA to the guest
memory (please correct me if you mean something different). I think with
pKVM it should be already possible to do securely and without extra
hardening in the guest (modulo establishing trust between the guest and
the TPM, which you mentioned, but that is needed anyway?). The
hypervisor in any case ensures protection of the guest memory from the
host devices DMA via IOMMU. Also the hypervisor allows the guest to
explicitly share its memory pages with the host via a hypercall. Those
shared pages, and only those, become accessible by the host devices DMA
as well.

P.S. I know that on chromebooks the TPM can't possibly do DMA. :)

> The minimum starting point for something like this would be a shared
> memory region visible to both the guest and the host. Given that it
> should be possible to build communication primitives on top, but yes
> ideally something like vsock or virtio would just work without
> introducing risk of exploitation and typically the hypervisor is
> trusted. Maybe this could be modeled as sibling to sibling
> virtio/vsock?
