Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7F168
	for <linux-coco@lists.linux.dev>; Mon,  2 Aug 2021 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627930058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tUKWkMeQsSWEtCeAubGhlT01HSrUGdhuY5cfxhdFAc=;
	b=dQk3PxT2mMRxgDfIjefLdVjQf4B5IYVOVBB8W1w97fUE/h+MNqE5LWCcjvnSTPGDupiLSZ
	n3GyjfFVpxlV3M43MSsr+M9tIU3CB4ZrcYS3LMoGL6+cxitfoBHAyIubd3I7eiN8gVgbHM
	M0lgXs3vKUvRXTb0v/wdJNgzk294Vwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-EPfXGC8WO_Kyr8iHuzvfIw-1; Mon, 02 Aug 2021 14:47:37 -0400
X-MC-Unique: EPfXGC8WO_Kyr8iHuzvfIw-1
Received: by mail-wr1-f70.google.com with SMTP id z10-20020adfdf8a0000b02901536d17cd63so6795292wrl.21
        for <linux-coco@lists.linux.dev>; Mon, 02 Aug 2021 11:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+tUKWkMeQsSWEtCeAubGhlT01HSrUGdhuY5cfxhdFAc=;
        b=Gh9Ef1TTHqMu+kKeng6/8Wez7fHviEISidv+eNT8K+DozYXSxNtcVN/ziURaBWMVr7
         S69jkDClVNnoDXRn3mSnkry4u5CG3Ll9s5NyQBhQ508zh715UT/RO9+29WxMesz4VJKE
         u18GGX9fxB6fyITjtjw56DYgNBPcTn6AtwVoeC54i6f2+zQVDRBbm00e7x00h7iTxAfZ
         anTXeYXAyZHyOrGAIEnRzQwTP+MOVyd1wSKYyhCt/sy65aoBaMvbC/GL1yoc2ta9wQtM
         hr7goP9xpDiplPeJfLw42H9gcpH0N5HIDumP9S1T+W9F0r9fj9RiebZZb1xHjX7r5T3q
         Vakg==
X-Gm-Message-State: AOAM5317/Z5ZRJJMSz9RljW2+oi/NaX46FNQ1LLiZG8I7YTUxie4oFRL
	u3BxZYt6ybXrMvlLufspmtuwcPOblYfaa3nkFMb8TG62/PBSuTd1pXPft88EuTvPObSHTsfKYL9
	Nw2DgLe0kFSvByQpdKW4oA83rcUKcpa3VYHCv/Dqi0sXEuTGEkPsgv98YNPFpLofsL50W5g==
X-Received: by 2002:a05:6000:1818:: with SMTP id m24mr19061612wrh.49.1627930056214;
        Mon, 02 Aug 2021 11:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGLzls7DU16mDoxCL8Z/qw6AL3eM1mcV6oWIwd0406N+uBq7aMeNLjgAj9sclyhtqxEWTXtw==
X-Received: by 2002:a05:6000:1818:: with SMTP id m24mr19061570wrh.49.1627930055907;
        Mon, 02 Aug 2021 11:47:35 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60af.dip0.t-ipconnect.de. [91.12.96.175])
        by smtp.gmail.com with ESMTPSA id z5sm164744wmp.26.2021.08.02.11.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 11:47:35 -0700 (PDT)
To: Joerg Roedel <joro@8bytes.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam
 <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210720173004.ucrliup5o7l3jfq3@box.shutemov.name>
 <fa38e74e-e7ca-39f3-f2db-f0a0de152edb@redhat.com>
 <YP8G1EuMPk1U40kz@8bytes.org>
 <023d2435-8cc7-dc44-6258-4135136ddfba@redhat.com>
 <YQfGo2rVgW0wkLnv@8bytes.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <470865dc-64dc-713e-c8df-99a9067a19ba@redhat.com>
Date: Mon, 2 Aug 2021 20:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YQfGo2rVgW0wkLnv@8bytes.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.08.21 12:19, Joerg Roedel wrote:
> On Tue, Jul 27, 2021 at 11:34:47AM +0200, David Hildenbrand wrote:
>> What makes you think that? I already heard people express desires for memory
>> hot(un)plug, especially in the context of running containers inside
>> encrypted VMs. And static bitmaps are naturally a bad choice for changing
>> memory layouts.
> 
> In the worst case some memory in the bitmap is wasted when memory is
> hot-unplugged. The amount depends on how much memory one bit covers, but
> I don't see this as a show stopper.

Devil's in the details when you want to hotplug later; for example, 
before parsing SRAT, we have no clue how much memory we might have at 
one point at runtime later. And you'd have to prepare for that by 
allocating the bitmap accordingly. And as I said, it's not a sparse data 
structure, so you will at least waste some memory.

>> I'm wondering, why exactly would a kdump kernel (not touching memory of the
>> old kernel while booting up) need access to the bitmap? Just wondering, for
>> ACPI tables and such? I can understand why makedumpfile would need that
>> information when actually dumping memory of the old kernel, but it would
>> have access to the memmap of the old kernel to obtain that information.
> 
> The kdump kernel needs the bitmap to detect when the Hypervisor is doing
> something malicious, well, at least on its own memory. The kdump kernel
> has full access to the previous kernels memory and could also be tricked
> by the Hypervisor to reveal secrets.

That's an interesting thought. But this raises many questions, how and 
what to dump in context of encrypted VMs at all. I'd love to see some 
writeup of what we actually want to dump, with which tools, and to which 
(encrypted?) locations.

The kdump kernel has access to the memmap of the old kernel. The memmap 
of the old kernel would contain information regarding encrypted pages. 
The kdump kernel and the tools (makedumpfile) running in the VM cannot 
be tampered with by the hypervisor. The memmap of the old kernel cannot 
be tampered with, as it resides on encrypted memory. Are my assumptions 
correct?

I'd be interested how a hypervisor could trigger revealing secrets.

> 
>> Mirroring is a good point. But I'd suggest using the bitmap only during
>> early boot if really necessary and after syncing it to the bitmap, get rid
>> of it. Sure, kexec is more challenging, but at least it's a clean design. We
>> can always try expressing the state of validated memory in the e820 map we
>> present to the kexec kernel.
> 
> It depends on how fragmented the validated/unvalidated regions will get
> over time. I think currently it is not very fragmented, the biggest
> shared regions are the .bss_decrypted section and the DMA bounce buffer.
> But there are also a couple of page-size regions which need to be
> shared. For kexec these regions can be validated again when tearing down
> the APs, but for kdump it would be too fragile to do such extensive
> stuff before jumping the the kdump kernel.

Right, I don't really see a blocker for kexec, just needs some proper 
creation/update of the e820 map. For kdump, I am not sure if we really 
need it, but most probably if we would have a complete picture of kdump 
for encrypted VMs it would get much clearer what we actually have to 
care about.


-- 
Thanks,

David / dhildenb

