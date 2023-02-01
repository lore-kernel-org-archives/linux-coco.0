Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAABEDA
	for <linux-coco@lists.linux.dev>; Wed,  1 Feb 2023 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675248774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YUEEBOttW7ks5TRMwlnN47/bwBK6Kba5ezsIULA3W8s=;
	b=O5p7iYdqLdwMHIa+O7em2x1a27f8IXu7PH+DN7txFo0hVGiqQoeN8sqwrUeir9U3XOsQi5
	jYWadUvb6OjhCGPv08ByKzxymMNJ+VmKlvF9SJkTeviIUn0sP5PmyHN6WReuCfu9DmiwIy
	dN3Wyf5P18wXAGRXA5PF4iYBvUKbVaw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-qBIv8nkxPJq_OI3--W_R4w-1; Wed, 01 Feb 2023 05:52:53 -0500
X-MC-Unique: qBIv8nkxPJq_OI3--W_R4w-1
Received: by mail-qk1-f199.google.com with SMTP id c9-20020a05620a11a900b0072a014ecc4aso409423qkk.18
        for <linux-coco@lists.linux.dev>; Wed, 01 Feb 2023 02:52:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxaZ2Gw7LqOcL0Mlhbpw1+6NsEEwQcG6K+vDjNiXi54=;
        b=rQv17397X5LHYCK5+5UK8SSwT5mcqs6qFrrtK7GCc/yFJuszNATdKsMC+bwrl4Q/Qj
         BGiugZIjP4oU+oBK30nQUAWIzQO0sEwMeqTwqmHgLBRYP4a62oDqyKQ9hfRDJYGDHiQm
         5nW9h4NNYPfWx09tVa5NUwR3dVavy2hPGcQWBn6knADeo1pfr6p1/9acOUmH1tK/wQm9
         0WKfOJHLGb6Xus2yVM8XCfGPfw2JDGFLpYoslf3ISky4qHLKCbn8wRphol0/yDG6fvUZ
         ellEEp2OIhYLN0DgYuDn/uZmSMjJL5W6h6M0JbmhWi6MQCIRxOl2LAdxyDD/njit31Fg
         MxgQ==
X-Gm-Message-State: AO0yUKUMsotoIykvbLxGawtbEiOhYQZBCXgAF2QrZD/HbMxKsl0Ghwd6
	O/bgATqA4pVc0y4B2Ag0KPvrQ+G7zEKvjrB/LFmeB4lwp7DVHzr2Cx2bP8dfNCJ8W6OEs+I5GSr
	SRzFCPeu2XhRNJ7mdTPd80g==
X-Received: by 2002:ac8:5911:0:b0:3b6:2f0d:1925 with SMTP id 17-20020ac85911000000b003b62f0d1925mr3434825qty.64.1675248773139;
        Wed, 01 Feb 2023 02:52:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+IvqbyxQtWWVQUlCH2jBkKrS1mKBDdizFvTP4b3IBc/xszHhDfn9+TdxtvHFgYB2Uj61WVMw==
X-Received: by 2002:ac8:5911:0:b0:3b6:2f0d:1925 with SMTP id 17-20020ac85911000000b003b62f0d1925mr3434799qty.64.1675248772813;
        Wed, 01 Feb 2023 02:52:52 -0800 (PST)
Received: from smtpclient.apple (82-65-201-253.subs.proxad.net. [82.65.201.253])
        by smtp.gmail.com with ESMTPSA id p23-20020a05620a22b700b00725d8d6983asm2975247qkh.61.2023.02.01.02.52.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2023 02:52:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: Linux guest kernel threat model for Confidential Computing
From: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
In-Reply-To: <20230131123033-mutt-send-email-mst@kernel.org>
Date: Wed, 1 Feb 2023 11:52:27 +0100
Cc: Christophe de Dinechin <dinechin@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Reshetova, Elena" <elena.reshetova@intel.com>,
 Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Shishkin, Alexander" <alexander.shishkin@intel.com>,
 "Shutemov, Kirill" <kirill.shutemov@intel.com>,
 "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
 "Kleen, Andi" <andi.kleen@intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 "Wunner, Lukas" <lukas.wunner@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>,
 "Poimboe, Josh" <jpoimboe@redhat.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 Cfir Cohen <cfir@google.com>,
 Marc Orr <marcorr@google.com>,
 "jbachmann@google.com" <jbachmann@google.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 James Morris <jmorris@namei.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "Lange, Jon" <jlange@microsoft.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>
Message-Id: <6BCC3285-ACA3-4E38-8811-1A91C9F03852@redhat.com>
References: <Y9Jh2x9XJE1KEUg6@unreal>
 <DM8PR11MB5750414F6638169C7097E365E7CF9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9JyW5bUqV7gWmU8@unreal>
 <DM8PR11MB57507D9C941D77E148EE9E87E7CF9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <702f22df28e628d41babcf670c909f1fa1bb3c0c.camel@linux.ibm.com>
 <DM8PR11MB5750F939C0B70939AD3CBC37E7D39@DM8PR11MB5750.namprd11.prod.outlook.com>
 <220b0be95a8c733f0a6eeddc08e37977ee21d518.camel@linux.ibm.com>
 <DM8PR11MB575074D3BCBD02F3DD677A57E7D09@DM8PR11MB5750.namprd11.prod.outlook.com>
 <261bc99edc43990eecb1aac4fe8005cedc495c20.camel@linux.ibm.com>
 <m2h6w6k5on.fsf@redhat.com> <20230131123033-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 31 Jan 2023, at 18:39, Michael S. Tsirkin <mst@redhat.com> wrote:
>=20
> On Tue, Jan 31, 2023 at 04:14:29PM +0100, Christophe de Dinechin wrote:
>> Finally, security considerations that apply irrespective of whether the
>> platform is confidential or not are also outside of the scope of this
>> document. This includes topics ranging from timing attacks to social
>> engineering.
>=20
> Why are timing attacks by hypervisor on the guest out of scope?

Good point.

I was thinking that mitigation against timing attacks is the same
irrespective of the source of the attack. However, because the HV
controls CPU time allocation, there are presumably attacks that
are made much easier through the HV. Those should be listed.

>=20
>> </doc>
>>=20
>> Feel free to comment and reword at will ;-)
>>=20
>>=20
>> 3/ PCI-as-a-threat: where does that come from
>>=20
>> Isn't there a fundamental difference, from a threat model perspective,
>> between a bad actor, say a rogue sysadmin dumping the guest memory (whic=
h CC
>> should defeat) and compromised software feeding us bad data? I think the=
re
>> is: at leats inside the TCB, we can detect bad software using measuremen=
ts,
>> and prevent it from running using attestation.  In other words, we first
>> check what we will run, then we run it. The security there is that we kn=
ow
>> what we are running. The trust we have in the software is from testing,
>> reviewing or using it.
>>=20
>> This relies on a key aspect provided by TDX and SEV, which is that the
>> software being measured is largely tamper-resistant thanks to memory
>> encryption. In other words, after you have measured your guest software
>> stack, the host or hypervisor cannot willy-nilly change it.
>>=20
>> So this brings me to the next question: is there any way we could offer =
the
>> same kind of service for KVM and qemu? The measurement part seems relati=
vely
>> easy. Thetamper-resistant part, on the other hand, seems quite difficult=
 to
>> me. But maybe someone else will have a brilliant idea?
>>=20
>> So I'm asking the question, because if you could somehow prove to the gu=
est
>> not only that it's running the right guest stack (as we can do today) bu=
t
>> also a known host/KVM/hypervisor stack, we would also switch the potenti=
al
>> issues with PCI, MSRs and the like from "malicious" to merely "bogus", a=
nd
>> this is something which is evidently easier to deal with.
>=20
> Agree absolutely that's much easier.
>=20
>> I briefly discussed this with James, and he pointed out two interesting
>> aspects of that question:
>>=20
>> 1/ In the CC world, we don't really care about *virtual* PCI devices. We
>>   care about either virtio devices, or physical ones being passed throug=
h
>>   to the guest. Let's assume physical ones can be trusted, see above.
>>   That leaves virtio devices. How much damage can a malicious virtio dev=
ice
>>   do to the guest kernel, and can this lead to secrets being leaked?
>>=20
>> 2/ He was not as negative as I anticipated on the possibility of somehow
>>   being able to prevent tampering of the guest. One example he mentioned=
 is
>>   a research paper [1] about running the hypervisor itself inside an
>>   "outer" TCB, using VMPLs on AMD. Maybe something similar can be achiev=
ed
>>   with TDX using secure enclaves or some other mechanism?
>=20
> Or even just secureboot based root of trust?

You mean host secureboot? Or guest?

If it=E2=80=99s host, then the problem is detecting malicious tampering wit=
h
host code (whether it=E2=80=99s kernel or hypervisor).

If it=E2=80=99s guest, at the moment at least, the measurements do not exte=
nd
beyond the TCB.

>=20
> --=20
> MST
>=20

