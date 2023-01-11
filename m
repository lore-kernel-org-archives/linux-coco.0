Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF6429A9
	for <linux-coco@lists.linux.dev>; Wed, 11 Jan 2023 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673462713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/KUWnmnt2oHH7wDKqvmoQUwRtte4ykq0/M/VB2RCcIM=;
	b=SNtyFFqpkArZ+rJe2/bgX9kWcF4wF2+GKBT/0+Mqq0twR86cYpUe3MY+MxVCwrAZG/TyYo
	129DvmLapYgVGmlIUl7aInSLbTh6bCszpzFkV4qB93+kuWZJbHL4v9kl6S0Tmde9JX1J2B
	iW7SOTbWHSvltdNaazILmIDDIbvOpOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-BSO-3FsNPOKR9DC5v2Q7Rg-1; Wed, 11 Jan 2023 13:45:09 -0500
X-MC-Unique: BSO-3FsNPOKR9DC5v2Q7Rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6795218A065E;
	Wed, 11 Jan 2023 18:45:09 +0000 (UTC)
Received: from ptitbras (unknown [10.39.192.131])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5F22026D68;
	Wed, 11 Jan 2023 18:45:08 +0000 (UTC)
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
User-agent: mu4e 1.8.0; emacs 28.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Date: Wed, 11 Jan 2023 17:39:06 +0100
In-reply-to: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
Message-ID: <m2tu0wrjv0.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Hi Tom,


On 2023-01-10 at 12:54 -06, Tom Lendacky <thomas.lendacky@amd.com> wrote...
> Attached is an updated draft version of the SVSM specification with added
> support for an attestation protocol and a vTPM protocol as well as other
> miscellaneous changes (all identified by change bar). Please take a look and
> reply with any feedback you may have.
>
> Thanks,
> Tom

Thanks for sharing.

This is the first time I actually review that document, so my feedback will
be a bit longer than most. Also, I read it at a time where I had lost
network access to Internet, so RTFM wasn't an option...

First, the actual errors:
p9: Typo VMLP1+ instead of VMPL1+
p18: "bit1=0" and "bit1=1": That seems to be bit 2

Then the more mundane comments

p9: "expected that, but not limited to": the wording sounds strange to me
p9: Undefined acronym (*) VMSA

p10: "certain forms of RMPADJUST": The body of the document seems to
     indicate that the required RMPADJUST are performed as part of the
     various other services. There is no explicit need (apparently) for a
     separate guest-accessible RMPADJUST. Maybe expand a little bit on this
     topic, and explain if the guest is supposed to do any RMPADJUST if
     running at VMPL1.
p10: gPA space of the guest: "of the guest" seems redundant, since it's gPAs
p10: lower VMPL -> less privileged VMPL, or explain that "lower" privilege
     levels have a higher number.
p10: "The initial SVSM memory configuration...": Unclear what "required"
     means in that sentence. Is that the core protocol? Can "create VCPU"
     request additional memory, for example?

p11: No explanation of how the SVSM knows where the secrets page is.
     Probably need an xref to some other doc.
p11: Who does the initial construction of the secrets page? What happens if
     that other actor does not write zeroes? What attacks can the host
     perform on the secrets page if any?
p11: undefined acronym VMPCK
p11: Why should the guest OS "capture" the SVSM_CAA value? In what sense?
     Is it because it can change afterwards, or because the secrets page
     becomes unavailable, or for another reason?
p11: Byte offset in secrets page fields starts at 0x140. Explain why this is
     safe, and how other possible users of the secrets page would avoid
     stomping on that area.

p12: How does the SVSM "terminate"? Is it a regular guest shutdown, or some
     other mechanism, or is unspecified? Can the SVSM log anything, and if
     so, where would it be found? (I assume that would be host platform
     specific, but would still be noteworthy in this specification)

p13: "Use of the Calling Area is necessary..." effectively, this is a single
     byte in the calling area, right? So it's not really "ensuring", maybe
     "detect" spurious invokation (1). I think malicious invokations are not
     made too difficult by this mechanism, since there are only two states,
     and the host still controls when vCPUs run.

p14: Undefined acronyms: GHCB, MSR
p14: I think GHCB Specification is an external reference, worthy having
     italics and a precise reference / link (can't check, no network ATM)
p14: "If the host illegally entered the SVSM, this field will be zero": I
     believe that the conditions enforcing this should be precisely spelled
     out, including for a host with malicious intent. If the mechanism is
     indeed robust, then we are not protecting against "spurious" calls but
     against "spurious or malicious" calls. Otherwise, "will be zero" should
     be replaced by "should normally be zero".
p14: "only after VMSA.RAX and SVSM_CALL_PENDING": this suggests that there
     is some kind of possible race condition here. If that is true, then
     maybe there is a need to specify memory ordering semantics on the three
     relevant fields?

p16: PVALIDATE: What happens if a guest is unaware of SVSM and executes
     PVALIDATE directly? Is the SVSM supposed to emulate that, or to punish
     the guest, or something else? Is that even possible for the SVSM to
     trap and emulate relevant VMPL1 instructions? Also see note on page 10
     regarding RMPADJUST.
p16: "It affects the Calling Area for calling vCPU only": This seems slighly
     inconsistent with page 9 "other SVSM implementations may choose a
     single execution context that services all guest VCPUs".
p16: Alignment for RCX is 8 bytes, but alignment for RDX in
     SVSM_CORE_CREATE_VCPU is 4K. Is that not the same calling area?
     Also, what is the use case for moving the calling area?

p17: The table links appear in a strange colour (some kind of weird cyan).
     It seems clickable too, so I suspect a hyperlink, but since the link is
     always on the same page, it's not super-useful.

p18: Is the CAA seen as assigned to the SVSM? I believe the answer is no
p18: For increased readability, I suggest naming the error codes for the
     SVSM_CORE_PVALIDATE call, and putting them in a table.
     Also, why tag the specific errors right after the architectural
     PVALIDATE errors? In case of architectural extension, you'd always get
     0x8000_1011, which is not super helpful. Instead, you could reserve
     0x8000_1xxx for protocol errors, and put PVALIDATE errors at
     0x9nnn_nnnn, which probably gives you enough room at least for the
     coming 6 months.
p18: "VMPL of the VCPU making the request": wouldn't it make sense to add a
     VMPL field in the PVALIDATE operation descriptor, so that the guest
     could control less-privileged VMPLs?
p18: As indicated earlier, I'm confused by the 4K alginment requirement for
     RDX (Calling Area gPA)
p18: What is the APIC ID of the vCPU used for? I see no mention in the
     explanatory text. Is that an internal index, or does the SVSM
     implementation need it for some reason (I was not clever enough to
     imagine why)

p19: What specification defines FAIL_INUSE? Add xref?

p20: Evidently, SVSM_CORE_DEPOSIT_MEM is intended to be used when another
     service returns 0x4mmm_mmmm. However, in the presence of a flag
     indicating "I may no longer need this memory", and given the
     limitations "cannot cross a page", I am concerned about possible lack
     of forward progress if two vCPUs start parallel operations where one
     vCPU says "Hey, I need X terabytes of RAM to do that" (which will then
     be split into umteen DEPOSIT_MEM calls due to page limit), while
     another says "Hey guys, I'm done" and sets the MEM_AVAILABLE flag. I
     see nothing in the spec that would prevent the second CPU from actively
     withdrawing the memory that the first one is trying to deposit. I think
     that the spec should clarify a forward-progress logic that prevents
     that from happening.
p20: It would be interesting to have at least a vague idea of what
     operations can actually request more memory, just to set expectations.
p20: Suppose that CREATE_VCPU requests more memory. It has no obvious
     "restart" field, unlike things like PVALIDATE. That means that there
     should be a rather strong guarantee that all SVSM calls that can
     potentially return 0x4mmm_mmmm either have no effect when they return
     such a request, or are idempotent if called again after providing more
     memory.

p21: The MEM_AVAILABLE flag is set in the calling area of the startup vCPU.
     Is there any requirement that WITHDRAW_MEM should only be called from
     the startup vCPU, or from only one vCPU at a time?

p22: The writable area ends at a page boundary. What could be a vald
     rationale for setting the RCX pointer in the middle of a page?
     Maybe simpler to require that the pointer be page-aligned than have a
     spec that mentions page offset 0xFF8 as a special case...
p22: Rationale for not returning incomplete? I'm trying to see how the guest
     could efficiently let secondary vCPUs withdraw memory with the protocol
     as specified, without a little additional wording regarding either the
     memory semantics of the MEM_AVAILABLE flag, and telling if there is
     indeed more work to be done by this vCPU using SVSM_ERR_INCOMPLETE.

p23: Table 9 is mnissing RDX, R8 and R9 rows (as input for configuration)
p23: Table 9 title should be "configuration or query"
p23: RCX result is the same for query and configuration, or is that for
     query only?
p23: At the specified RIP. If Bit 3 is not set in the configuration case,
     does it return after the VMGEXIT?

p29: Table 14: How can RAX be used as command ordinal and command response
     size if it's already used for call identifier / result value?

p30: Why would you need 4 bytes for the TPM command ordinal? This causes the
     TPM command size to be misaligned. What about 2 bytes for command
     ordinal, one byte for locality, and one reserved byte?


(*) Like most readers of this document, I know what it means, but since you
defined VMM just above, or VM the page before, I interpreted your intent to
be that every acronym should be defined on first use.

(1) As I am writing this, I have a doubt what happens if the host writes to
    the secrets page, and can't verify easily without a network.

>
> [2. application/pdf; 58019-Secure_VM_Service_Module_Specification.pdf]...


--
Cheers,
Christophe de Dinechin (https://c3d.github.io)
Theory of Incomplete Measurements (https://c3d.github.io/TIM)

