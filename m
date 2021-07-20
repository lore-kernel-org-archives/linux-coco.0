Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07D168
	for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 19:54:28 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id y3so7567386plp.4
        for <linux-coco@lists.linux.dev>; Tue, 20 Jul 2021 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZeLArdOwF4c3/dM031IJ0PsQhPF9cHure1pZVMgRz14=;
        b=Ycdyq1Koqw5nqatustzX/3lxSMyaJ3MBd0LBcRK3vSZHgVkW5p3TptELx63aOLsZvj
         dSpcMfWs3+55T1t4bJzGjjnxwT+SuW5IkWd5Lx2Z8jh0RitqG2idOsaonGxj2fqo8R0y
         TM9Qy1fzy2zBMh0ZGkjm880ga1/5m309u/y18pMyZYmgTZRK8PE5CAJMJ2xygsNSaqcJ
         LLHdgb7Oc1TXfEKxLArgHccTQIjDSqpHVd7nlAnvApAK0LjqIgzbUYVry2qlHcZT9XGn
         jK9U4JMnLXhF3nj8lY6vkGvzoZmT7lyWiwZUYfniF4i2hS9WL7A3RILu0v5RqdY6qJhd
         AXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZeLArdOwF4c3/dM031IJ0PsQhPF9cHure1pZVMgRz14=;
        b=qjw4jDLsmT10Sm5XLdXS4nxCYSu8VE8vkuLVkCwbcRf72Z5DpMlB36zKaWPuz82KGV
         2FLBDIuGbVEUeL8dMj1hL0yZxE9kDNfGBaLExVerRfdV4SDrHJqQ9lmyHA8m9eHblGC4
         0/0yngca/u+3ovykEs2kj2olZK0ZpN1fTwx3OZfvRwOSUhqGtaCCxld/Ln7zyqbZF6++
         A3OdOOeOxPDxE7n1MpO4ZPIgqfoCo7SrJChsAIy86lgnIDvnzk4EG8xW5SRjKzRg06Y9
         T9DznaWw400Dz6SbxmVfCb4rRGpcZmTTs83tn4ZkHjFAHjgpLkPGBOOgDdwIZ1CVolSZ
         DBpQ==
X-Gm-Message-State: AOAM532n3vKdzrZEyqfD6sqJlE/05akJBS4NYP3zOp8fkmQbTRxLy4sF
	7rCwi1q8f0LPknw/xnQgiTIoC910SDs85j9ALBtbkA==
X-Google-Smtp-Source: ABdhPJzUuzNf/3K19rxIA+H4yJeU72HxIaji1TTHMpDiABGGWGhdOGLMbUtX0qh/oukG/ldzaCSp4dHv6espN8e7ewI=
X-Received: by 2002:a17:90b:787:: with SMTP id l7mr70312pjz.162.1626810867697;
 Tue, 20 Jul 2021 12:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <a5ac5af6-7e28-4e9c-e55b-db31842a5911@kernel.org>
 <CAAYXXYwFzrf8uY-PFkMRSG28+HztfGdJft8kB3Y3keWCx9K8TQ@mail.gmail.com> <eacb9c1f-2c61-4a7f-b5a3-7bf579e6cbf6@www.fastmail.com>
In-Reply-To: <eacb9c1f-2c61-4a7f-b5a3-7bf579e6cbf6@www.fastmail.com>
From: Erdem Aktas <erdemaktas@google.com>
Date: Tue, 20 Jul 2021 12:54:16 -0700
Message-ID: <CAAYXXYzDheR6C19Q01w267CfgW6DnZ-Hurscm-=OVATwb4dy4Q@mail.gmail.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: Andy Lutomirski <luto@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	"Kaplan, David" <David.Kaplan@amd.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, "the arch/x86 maintainers" <x86@kernel.org>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 8:30 PM Andy Lutomirski <luto@kernel.org> wrote:
> What=E2=80=99s the attack you have in mind?  With TDX, the guest using th=
e wrong shared vs secure type should, at worst, cause > crashes.  With SEV,=
 I can imagine it=E2=80=99s possible for a guest to read or write the ciphe=
rtext of a private page, but actually
> turning that into an attack seems like it would require convincing a gues=
t to use the same page with both modes.

There are a couple of things that can go wrong (maybe more):

Imagine Guest set a page shared. It is assumed that the host should
remove the SEPT entry but it does not have to, so that entry might
stay there with a valid bit set.

Guest should accept a page before it accesses it the first time or
guest can accept a page as part of #VE handler when a PENDING page is
accessed.

Current guest patch series (v3) from intel does not have any #VE
handler to accept pages on the fly. It seems like it has an assumption
that all the pages are accepted by UEFI (I have not reviewed the code
yet in detail).

Now let's say the kernel wants to access a page for the first time, or
after a kexec it wants to make sure all the pages are private. it
needs to call tdx_hcall_gpa_intent or  tdg_accept_page individually.
If the page is already accepted, tdg_accept_page does not return any
error in the current implementation in v3. Depending on how this page
is being used, it's content is now "not zeroed" as opposed to what it
is being expected. Converting this to an attack is not trivial but
possible.

I did not see any #VE implementation to handle SEPT violations when a
page is in PENDING state. I am assuming that this needs to be
supported at some point (If not then we need to discuss the use cases
for such support).

In such an implementation, hypervisor can inject a zeroed page
anytime. This seems like a not big deal but IMO it is and it can be
used as an attack vector to change conditions, masking variables etc.

> >> At the risk of asking a potentially silly question, would it be
> >> reasonable to treat non-validated memory as not-present for kernel
> >> purposes and hot-add it in a thread as it gets validated?
>
> My concern with this is, it assumes that all the present memory is privat=
e. UEFI might have some pages which are shared therefore also are present.
>
>
> Why is this a problem?  In TDX, I don=E2=80=99t think shared pages need a=
ny sort of validation. The private memory needs acceptance, but only DoS sh=
ould be possible by getting it wrong. If EFI passed in a messy map with sha=
red and private transitions all over, there will be a lot of extents in the=
 map, but what actually goes wrong?

I mean if the only attack vector is DoS (which is not part of the
threat model that TDX is addressing), then why do we even need
tdaccept? I thought we need tdaccept to prevent VMM to change the
content of a page without guest knowing it.
My comment was about if we assume all non-validated memory as
not-present, how we were going to handle the shared pages transferred
from UEFI to kernel. Those are not validated but the range is present.
How can the guest kernel read those shared pages if it does not know
that they need to be mapped as shared in the first place.

Depending on how the guest kernel is handling shared to private page
conversion or how it is initializing the private pages for the first
time, a lot of things can go wrong but I need to look at the code to
provide more concrete examples.

-Erdem
