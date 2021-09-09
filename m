Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E9B3FF0
	for <linux-coco@lists.linux.dev>; Thu,  9 Sep 2021 16:21:34 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id r3so3865671ljc.4
        for <linux-coco@lists.linux.dev>; Thu, 09 Sep 2021 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=50boaNouSSTnvb0c2eCNnctIiz+x2UvGPCv3kZE2AMI=;
        b=CGlS41mR+Axb4y9wrWknWpwz18CNGuBs4jPnMvqDoRK2oZuinLZetPH/MFKIb8QsFq
         dwjlyvlbpGylKPvinmbj4zrK082kTzJ/A04BP0LPHPiMny8rw5XtJdbuLyAS2Cu3Iq2a
         5mNDcYlZpJ2rQYFynA/vjgP5nvtJhW6kmblNhC/mlC/ZRbrsvDSWmxVX/yijiPJwLctZ
         Ok3XosICIt8PBk3Z4ObHrWttu9jOcUZBhM97/+okCfieuqwKAP85xxSsRIcM0i6dEpx6
         CSdgzkqPT6zNjVZ+EGv4lv3irK7wfuuFFRAdH8Mg0EGSH/uIQU2+RRXceMf1eqItaojC
         GeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=50boaNouSSTnvb0c2eCNnctIiz+x2UvGPCv3kZE2AMI=;
        b=S7s4YOOUKqWS5vK5mRCbPkouEBKjjAxKErZVU3eOISeupV8wlVarKz351j1lZcFEA5
         RpqJy6CdilUnsV9Jqmgjv0YcbYvrjxA0zmLvBcJz/3vvl36Ns9YXZuDqyNX/JM+B7prw
         1kz5QxEf/+3YbWmTWh1sczGZlnbCKKoqG7pZTEOZOXNobvNPOfPzevyWYPxvhMWCcpX5
         sQcvg/cr54IZMlZg7F305Zegtv6cd2dMfT4wmwAbWMksdhZKsBTPAabFTusW+43r1wis
         h/Rneah1mxPhulVtB0ScWLaD3+2U25NilShjqrwI1j9M6p25Bv4nMbYYYLRv2NYynjnK
         JW8g==
X-Gm-Message-State: AOAM531kIxGeDxBOlQ+X9qkCCnKgprZAPJV+vITooYrLhyW8CgOXdI8r
	fT/FlKaI9IBeJkRuBduKI5YB+TK41tLMIdPZHb5nug==
X-Google-Smtp-Source: ABdhPJzsPtWW1AxipaV2pMWSdisA0skj+HLtMngumlXVDQINaNFPekQ15ydtkZbF3rf81kHbTiw9diF0ZbdCGuQNGTc=
X-Received: by 2002:a05:651c:98c:: with SMTP id b12mr557878ljq.83.1631204492754;
 Thu, 09 Sep 2021 09:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820151933.22401-1-brijesh.singh@amd.com> <20210820151933.22401-35-brijesh.singh@amd.com>
 <CAMkAt6qQOgZVEMQdMXqvs2s8pELnAFV-Msgc2_MC5WOYf8oAiQ@mail.gmail.com>
 <4742dbfe-4e02-a7e3-6464-905ccc602e6c@amd.com> <CAMkAt6pT4vkgLxTN1Lj54ufaStyCHHitNaHAdZvEgDV8Nyrx-Q@mail.gmail.com>
 <f54f3fc3-14c3-5c36-2712-62eb625a958b@amd.com>
In-Reply-To: <f54f3fc3-14c3-5c36-2712-62eb625a958b@amd.com>
From: Peter Gonda <pgonda@google.com>
Date: Thu, 9 Sep 2021 10:21:20 -0600
Message-ID: <CAMkAt6oG0L4an-VgsADxz1xs6-wq3x4Qpxk9BdP=F2W3uT8U4g@mail.gmail.com>
Subject: Re: [PATCH Part1 v5 34/38] x86/sev: Add snp_msg_seqno() helper
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com, 
	Marc Orr <marcorr@google.com>, sathyanarayanan.kuppuswamy@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 10:17 AM Brijesh Singh <brijesh.singh@amd.com> wrote:
>
>
>
> On 9/9/21 10:43 AM, Peter Gonda wrote:
> ...
>
> >>
> >> Does this address your concern?
> >
> > So the 'snp_msg_seqno()' call in 'enc_payload' will not increment the
> > counter, its only incremented on 'snp_gen_msg_seqno()'? If thats
> > correct, that addresses my first concern.
> >
>
> Yes, that is goal.
>
> >>>
> >>
> >> So far, the only user for the snp_msg_seqno() is the attestation driver.
> >> And the driver is designed to serialize the vmgexit request and thus we
> >> should not run into concurrence issue.
> >
> > That seems a little dangerous as any module new code or out-of-tree
> > module could use this function thus revealing this race condition
> > right? Could we at least have a comment on these functions
> > (snp_msg_seqno and snp_gen_msg_seqno) noting this?
> >
>
> Yes, if the driver is not performing the serialization then we will get
> into race condition.
>
> One way to avoid this requirement is to do all the crypto inside the
> snp_issue_guest_request() and eliminate the need to export the
> snp_msg_seqno().
>
> I will add the comment about it in the function.

Actually I forgot that the sequence number is the only component of
the AES-GCM IV. Seen in 'enc_payload'. Given the AES-GCM spec requires
uniqueness of the IV. I think we should try a little harder than a
comment to guarantee we never expose 2 requests encrypted with the
same sequence number / IV. It's more than just a DOS against the
guest's PSP request ability but also could be a guest security issue,
thoughts?

https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-38d.pdf
(Section 8 page 18)

>
> thanks
