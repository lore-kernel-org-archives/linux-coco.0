Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E7C3D45D0
	for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781633402; cv=pass; b=tPEepU3Fz+GvXXEfhEv8PBXMoVLykVERIk3E1pT79JQHMoSI+xVHYvinmO7LT7Mw2OYWysYwttuMg/djq//2nMthljz1Sh/cHaK8wEXxEWZOuHu+xOVvMk9sL/wme0tfarP0fmgjGwo5nQzB1BQdbNpZsm8Y7mTHxKII2VL2PSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781633402; c=relaxed/simple;
	bh=hbZ7AtqKeATB2r4kr93uGgpM+Y/zj6+leroFxw5uOv8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mARvxXTcT0/GAooakcWVe8PfJvarksBQaFEjlToPED4AelVkwNmr7hqGU4GdsG4/dxRh2EJTpw/XB4MEIEVtOUT9ztp5qUSMCei4IzVieW4j92cSQOksk/xA6wXzdi0lRusKhuLOYNflpfSmRfWO/o3x4IAvjSMeDobwo4/3wFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D5QFutuc; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D5QFutuc"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137335bc3caso5951150c88.0
        for <linux-coco@lists.linux.dev>; Tue, 16 Jun 2026 11:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781633400; cv=none;
        d=google.com; s=arc-20240605;
        b=Lk9oQ7YKiZr5iLQMt5ptCmVNrYqAw1ATTC6uZVDogKRFpHgrSSs+sCcZy6JniQ/PTD
         SBGQuSozhB7DrdBYqSSO7rjbCzYD8thO48GUAquUq2zpXAhWjiMJIlkMK/bBlOPJ+2K3
         GWl5RaS52YbBx5JgPst+Gz3wsxV6DMBaXM1ns3154O65hXS4EsOKWB+ZxiakxSzg/BIY
         bKKnp1tz2t82wx/CRKstd0tPupsAoyct+HCrNxsSAMb3q+gdmkGtepFqICdpTIlfQAbM
         d0rPEsu4U2yGFxiDxr0pGx/cXgDgLsUpmAKjY2PmR83zJTnaqjIp87b7miCrLF9X8ndu
         ZNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=o82nbH8071ZDGLm0iYK2gdlkX600tsvrzfNh6VLN4Fo=;
        fh=PEiLEg6stAsYPNhOaSDO8fw2Rml2xH/XxnmvyGEc+AE=;
        b=JFrgMO1w9jxX2eSpQOMIxchRQnyt2UDu7Drw29niz1f4QcoN8KWPRk2tcszEPgHvNn
         qXArTazVVF07G9T5d+Iln2JxolmZk8ZAR+0xaS8c2bjlMb3uxxcjh8eaE2H3OD3P2XUI
         r0+XEQeIiLRsi1LMbVzm9KZmaBR5avMLX+470oj5vXAX83rqPjk+A4jSAN5OrYzs8CJp
         nJ8dYc4tQL6GhPt0DB0uStVgsCCUZp9PUvPBqXYvOvYYOO+LMRLFONRRZfA2YzbhuUJd
         fzJxWpZHssycNgRa2cjE5x+z37jz1LKGVt2nlr+StU2MM+xY2ezh0R+WlFyl4nRPh6su
         Wgiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781633400; x=1782238200; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o82nbH8071ZDGLm0iYK2gdlkX600tsvrzfNh6VLN4Fo=;
        b=D5QFutucSPC5tF9PlGNttapmlFbnNOXbTHF8T2MoZTAdYr2lrr1s/TMa2k/PjPJKO9
         Fg0KiWfNMrovr85xqRV79ARIXZHlFl2mUTDUAjXlPVnB22ZeHhEPQWuhAHowQKPRY/iC
         R+SBmFzYUwBqZPIiHszn7zse6telj1jhaUeha32bSm/JHTPkCKtLqFJvtJYCeS1v4sMn
         Doa+p8ln0z7vNTnWHZkjGSyyh9RGqL65u42x76HbrprnJmF76zoa6s6UkB3JgFbJuq/y
         z0v/97a2rXasbeGP10pBAefQ/8Iv44xkHUC2pJGtoTqLUYvh+1S3/x2sXxyH/qApIp04
         cxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781633400; x=1782238200;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o82nbH8071ZDGLm0iYK2gdlkX600tsvrzfNh6VLN4Fo=;
        b=OrfIF+m/evTJqKm4mTjnIjzIVCYVT1WIgUTWdurgrcu4variMjMcT3QDHBrqJQDFPt
         QJSR2poE3sP0AQcR3BL12F+y6u7gL1qgostg0AN89R/yyTK3vUaolIN2l89Nfvnfi1kJ
         9m3G4R9PYiPV+0oSLu8tObT8+SR7iuLo6aexuei1u/YOjcUiL6DwKvbeItnblMYRQu87
         oGf3sOSV5/wiq0N069efpS4rH7avl/ObRf38bZlXt71w56iuSrCDYeRsGUGXODom4ZBj
         XRrG4q9PfV7tzJODU9hm6sUsUyiSgcbGVzLamcf4dUxr+UCany7BoWmfIKOImuGScUVG
         VMpA==
X-Forwarded-Encrypted: i=1; AFNElJ/jENhNWkybu7o1r0CPpMGDAbBPnGYK9kNkW2QpTGPgvMR0XXCCgblrEgySfqUfhbtUa+J5GsJ4NWJ+@lists.linux.dev
X-Gm-Message-State: AOJu0YzmBGlaqPgO/pl15zylYaGEjSC7LhExLl/KLoXLrxPP3/4CXHnr
	O1kAU3gs/dp0C7VTf+QrmDhMX6CAaidSOVBf6/YGt56YCzBHUORzJcZI7BvCS4aAGxRCsARSsnS
	HDj97oeflJldEF7kFM9vhB0Gu5qTf0mC6taIH2fdL
X-Gm-Gg: Acq92OHFbjeOmqsDMQLQgJUm9Y24c4v5yWjrCWdirohfSp5fz3Zd7J0Kcbm8bB+wSrc
	kad/Y3lwyAWb4mGVZF5kVHEDFYB3LHQCxkhfwhKdPBHseo4JoPB94G22Ng+q7kq95fJfJNlTLW7
	LamW1Ub5XYBdWk101nbae7DWqn5JVmQ9ujuRTf4dwkWFaMAEI+mynz+HcH1HUIMtPVUHnWY1Nyb
	ZDbELIk68sggUhA/IchZayrEZzFWN3q+vcpEswzOf5RKH6pUeyBQRp5ItWATAfSl6LFLCkoD3wa
	/6vpjVp8x5rff8lHMOG3guqrmCWr7ZCcMb6RzKyz0VDIzJNEnWc00o/XEEacw22uTwMsifGBzAb
	iT7km
X-Received: by 2002:a05:7022:622:b0:137:9399:fc59 with SMTP id
 a92af1059eb24-1398f69626amr23221c88.21.1781633399141; Tue, 16 Jun 2026
 11:09:59 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 11:09:58 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 11:09:58 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1e77f24d-315a-4f68-a109-2f4520343c0c@kernel.org>
References: <20260611-shivank-gmem-migrate-v1-0-2d266bfc6f95@amd.com>
 <ai_XK__RTXMCEcCG@raptor> <ai_aczmeH2IA6JaB@raptor> <ajA4z_Wkb93cTW4m@google.com>
 <1e77f24d-315a-4f68-a109-2f4520343c0c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 11:09:58 -0700
X-Gm-Features: AVVi8Cfci2aZVOJMaXs8XbxR0646nJUtiwZFbcmm9wi2jMlpzFimiOSyoy_glyY
Message-ID: <CAEvNRgFQLEsKanKrj=ePHoShiY2cgQgxtGs_2CJcZHP=JOjidg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] KVM: guest_memfd: folio migration for
 non-confidential VMs
To: "David Hildenbrand (Arm)" <david@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Shivank Garg <shivankg@amd.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Ira Weiny <ira.weiny@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>, Fuad Tabba <tabba@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Nikita Kalyazin <nikita.kalyazin@linux.dev>, 
	Patrick Roy <patrick.roy@linux.dev>, Pratik Sampat <prsampat@amd.com>, 
	Ashish Kalra <Ashish.Kalra@amd.com>, linux-fsdevel@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 6/15/26 19:39, Sean Christopherson wrote:
>> On Mon, Jun 15, 2026, Alexandru Elisei wrote:
>>> Hi,
>>>
>>> On Mon, Jun 15, 2026 at 11:43:14AM +0100, Alexandru Elisei wrote:
>>>> Hi,
>>>>
>>>>
>>>> I always thought that one of the nice things about using guest_memfd as a
>>>> memory backend, as opposed to host userspace mappings, is that the host
>>>> cannot unmap VM memory because of KSM, automatic NUMA balancing, hugepage
>>>> collapse, compaction, etc, acting on the host userspace mapping of the
>>>> VM memory, and outside of the VMM's or KVM's control.
>>
>> +1000.  It's not just "nice to have", it's a core design principle of guest_memfd.
>
> Right, and I raised in the guest_memfd call also the rough idea of Alexandru's
> use case of having non-movable guest_memfd pages such that we can support use
> cases where we can hopefully guarantee that a stage-2 mapping will not just
> randomly go away.
>
>>
>>>> I think it would be useful to preserve this behaviour, even in the absence
>>>> of confidential VMs (i.e, guest_memfd file descriptor created with
>>>> GUEST_MEMFD_FLAG_MMAP).
>>>
>>> Just to be clear, I was thinking that it might be useful for both
>>> behaviours to exist (migratable and non-migratable) for non-confidential
>>> VMs, and allow KVM or userspace to decide which they prefer for a
>>> guest_memfd.

More concretely, are y'all pointing towards a
GUEST_MEMFD_FLAG_MIGRATABLE, which will set .migrate =
kvm_gmem_migrate_folio, and for now, error out for CoCo VMs?

>>
>> For the purposes of this discussion, we should separate the physical act of
>> migrating pages from the features that trigger migration.  As I said in last week's
>> guest-memfd call, I am a-ok with supporting page migration as a mechanism, but I
>> am dead set against supporting NUMA balancing, KSM, LRU-based swap/reclaim, and
>> anything else that goes against the goal of guest-first memory.
>
> Right. Page migration for supporting ZONE_MOVABLE/CMA, compaction, memory
> offlining, virtio-mem and possibly some collapse mechanism if we were to support
> THP of some sorts in guest_memfd would are all reasonable.
>

Background question: how would virtio-mem use migration in the host/guest_memfd?

> As soon as we mix in access/lru semantics, we're going into the wrong direction.
>
> Fortunately KSM is anon-only and not even worth a rant here :)
>
>
>
> --
> Cheers,
>
> David
