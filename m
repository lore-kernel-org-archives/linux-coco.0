Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535F173
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 02:01:00 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id h1so10694708plf.6
        for <linux-coco@lists.linux.dev>; Mon, 19 Jul 2021 19:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fhC8Ee84m8n91ic1agZoDi2pwIgBkw63s0oQyQatbeU=;
        b=MVzoQ8/S9EEvfjnmnz3u06MrGwyNTV2MI4XDsyzc7hTDbPd+pQctop5S4YRPYBXh+H
         NYSH/Ndk5n5G+Rfl8dw8FGYZiqQ/dfucJEp05lYYFZISV7uEEtsuyw/x6kmbYtxj7RSk
         +8u7rWJZn7AvNUJJfFjbkXQW3Hr6Wwap6rvVHRhVkNRT2MVztVuFZ57itjqyjWSCEC/c
         afvJ27Po0JXt981iQNIox4Z9FY66RJaB/A7MQN6BQGFlnBtecDuqJxUo+gAUji8RQc3T
         11vK5uIKJhQEWpkAMSAixN8z1y4JX8S09TK47FGjlMjrqgPj7ASt67NZO2PmDE5QTulv
         Ia9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fhC8Ee84m8n91ic1agZoDi2pwIgBkw63s0oQyQatbeU=;
        b=iE9QI4IjFGXB7hcN9FoEjbIKgDXHCQdRmSsam1d7IKg6PcZd12wdW0r2bSYm6VRhtm
         4Ik8UADfXeE6AzFBEBzttM8AgH1nm4VbLgfDwlhuDZx9pch56raYA6b0YoSPTyTGjydU
         kAoAe4HPC7VHW2sQS4X+0RKlQZvdRGz726zgWTyBTQsuFTmsX4YH84Kqj958HCHPyMST
         TtUDTvkOkUkR5XAlwoKebJf3dFJ5tCEW5HJNRMElpAhripEJbH+RAJpcInnxC26b4XLH
         YJ9J+V0ExbeDSWc3NMWPB73s9OXmGQJX7aiiEGwpXSViN6ZngotevnfqPzm5c2BYxjaN
         bSXA==
X-Gm-Message-State: AOAM530AI4frKeWPzXtpW5UExNPc8Q6ug1GYJcEf4bqtziQde6/UBsIb
	Ku5a+8UwLpevCWRIK4o56+8r9t/AsRjXJhIV/ubSvw==
X-Google-Smtp-Source: ABdhPJwb5tMwTeB9KzI6ba3L+IPAc2H3/M0IsXe5O4rpl1V3Z+DYi+nYlKvmONJMXuFmmjndn9LnKXLq+E47ZTDV9pI=
X-Received: by 2002:a17:90a:43c3:: with SMTP id r61mr33612552pjg.11.1626746459455;
 Mon, 19 Jul 2021 19:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
In-Reply-To: <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com>
From: Erdem Aktas <erdemaktas@google.com>
Date: Mon, 19 Jul 2021 19:00:48 -0700
Message-ID: <CAAYXXYyPnM1FE2BPbK-vz-QcZdQxPZmEbayohzt-gCM5V=2TaQ@mail.gmail.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Andy Lutomirski <luto@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	"Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

PS: Apologize for sending this twice (resending in plain text mode).

With the new UEFI memory type, option 2 seems like a better option to me.

I was thinking with the lack of new UEFI memory type support yet,
option 3 can be implemented as a temporary solution. IMO, this is
crucial for a reasonable boot performance.

> There's one exception to this, which is the previous memory view in
> crash kernels. But that's an relatively obscure case and there might be
> other solutions for this.

I think this is an important angle. It might cause reliability issues.
if kexec kernel does not know which page is shared or private, it can
use a previously shared page as a code page which will not work. It is
also a security concern. Hosts can always cause crashes which forces
guests to do kexec for crash dump. If the kexec kernel does not know
which pages are validated before, it might be compromised with page
replay attacks.

Also kexec is not only for crash dumps. For warm resets, kexec kernel
needs to know the valid page map.

>> Also in general i don't think it will really happen, at least initially.
>> All the shared buffers we use are allocated and never freed. So such a
>> problem could be deferred.

Does it not depend on kernel configs? Currently, there is a valid
control path in dma_alloc_coherent which might alloc and free shared
pages.

>> At the risk of asking a potentially silly question, would it be
>> reasonable to treat non-validated memory as not-present for kernel
>> purposes and hot-add it in a thread as it gets validated?

My concern with this is, it assumes that all the present memory is
private. UEFI might have some pages which are shared therefore also
are present.

> On Mon, Jul 19, 2021 at 5:26 PM Andy Lutomirski <luto@kernel.org> wrote:
>>
>> On 7/19/21 5:58 AM, Joerg Roedel wrote:
>>
>> > Memory Validation through the Boot Process and in the Running System
>> > --------------------------------------------------------------------
>> >
>> > The memory is validated throughout the boot process as described below.
>> > These steps assume a firmware is present, but this proposal does not
>> > strictly require a firmware. The tasks done be the firmware can also be
>> > done by the hypervisor before starting the guest. The steps are:
>> >
>> >       1. The firmware validates all memory which will not be owned by
>> >          the boot loader or the OS.
>> >
>> >       2. The firmware also validates the first X MB of memory, just
>> >          enough to run a boot loader and to load the compressed Linux
>> >          kernel image. X is not expected to be very large, 64 or 128
>> >          MB should be enough. This pre-validation should not cause
>> >          significant delays in the boot process.
>> >
>> >       3. The validated memory is marked E820-Usable in struct
>> >          boot_params for the Linux decompressor. The rest of the
>> >          memory is also passed to Linux via new special E820 entries
>> >          which mark the memory as Usable-but-Invalid.
>> >
>> >       4. When the Linux decompressor takes over control, it evaluates
>> >          the E820 table and calculates to total amount of memory
>> >          available to Linux (valid and invalid memory).
>> >
>> >          The decompressor allocates a physically contiguous data
>> >          structure at a random memory location which is big enough to
>> >          hold the the validation states of all 4kb pages available to
>> >          the guest. This data structure will be called the Validation
>> >          Bitmap through the rest of this document. The Validation
>> >          Bitmap is indexed by page frame numbers.
>>
>> At the risk of asking a potentially silly question, would it be
>> reasonable to treat non-validated memory as not-present for kernel
>> purposes and hot-add it in a thread as it gets validated?  Or would this
>> result in poor system behavior before enough memory is validated?
>> Perhaps we should block instead of failing allocations if we want more
>> memory than is currently validated?
>>
>> --Andy
>>
