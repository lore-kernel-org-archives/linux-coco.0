Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D33793D0
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 02:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525557; cv=pass; b=RTccDWT55KKj38VcTTL43D0RkxIYbbvPDaz1HjT6UuE8/msmpuf86LcN+pxumX/GAP9JkiODaXRR12VOhfAJ5mNRkyyK2PQNKApxEQjEIrkONfoLT/qdArbVJm7Ol7333io0ttskXVZuSwnLrkc92eIG0ZN/pZrhweibLqq77YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525557; c=relaxed/simple;
	bh=UbHdjXh+CgiQpvJHaSyIzPDW6diIJy69tmAGod3Q4Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXgYWmBN+MCpfS7DnWc9mHFGgFkopTTaGQBlJTLd3ElJRL1AVVRi/L7aMximQlli1AgMNJtaDgGJAriUnJuqi3y2/jdCxEEIbZvaWP2AG230kTEpLGo95b9G2zJ4/gn6hc5S4Y05E+7jHFdQkNyCeK4b+1IaGMbi9qDdDFBeYAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DxQST5uc; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DxQST5uc"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so3136a12.1
        for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 19:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789525550; cv=none;
        d=google.com; s=arc-20260327;
        b=TtHSmks+a6hTzqgZb7VvnaYNC/1Yi3EARVq1AAbfnq08978rLsEZr8Wyv9Vp6P2p7F
         zrOi7+XCnmhtc747qOX9NXErpOQG/X3WM7XqQdhvH/P2c6vQy9aMiESVwGEqS4Yyj0GQ
         r4JBiAx1597XIq3DHCuBYaLY85koFraQGdVirwFE65LAnE1q9CBUXNEgwQDAs+QZLIVY
         +C0Q3+1PE+tu9G+CtJWfTqHmIiIL9TSUcWfByCGk4+A3JFt1TQSYIZDCuxYGam77lEnQ
         pFXUw1klNYmblteQO8lpHXNZ67YQ67ZAqaKMs6XO+1vZtohFf91JsNIoK+uAEpb5pNW1
         URwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4v5CneiAAJU37Ea93Bpgw0r+62LGWh/ZxCVYmbedPc=;
        fh=6KPa9n1VjtHSIteT/X193mlNYz2LzpytDg2W0WqPhfQ=;
        b=g5DjRoubd6V5SxI3YNLkQJKd/ZSPjW0NsnkHKKd9cF7PCt9BOn4SbHnHxH8nUj0fYv
         6ifoB+Mkh6i0yhODQzeSYyR2Q3lpwT06lQzuX6VbFCvh0gjJIZWUOievrQuzzdKT1ZE4
         6gAnKPMJtEIO8u25yBk5XI2qjneJWmPfSgs7HK6Dj2q8ui+6vfbqsI4FacDWTgoe0mg+
         uBC+wJKWiqh0FeobqtIFtxGS+/x3fjanGB+7blrJc9V2+S9KJ/+EJlCMyIUynzCIe7rj
         y/givaui7I0InCoslL7DH43FSJ5AxXg8vtDaItx12nCr6mOctaKro2jfl6M6dVLMGbLU
         GYcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789525550; x=1790130350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4v5CneiAAJU37Ea93Bpgw0r+62LGWh/ZxCVYmbedPc=;
        b=DxQST5ucvwg6yIG+f8J9MG+bDzlHQO9ryYQP8tEyFuZ+wFw9uFcPINNPJoD3lvIQc1
         VOBMmh/+4dzi7VJROG2enNf07JlwQEu4hyfJ8z8VJfkM2ZTCgtpSHFTCIsmlf/axXIKm
         DAf3oV04JJv3wtbyq6qxqrTiLg+ozZJmSZyQ4wbyJkGmHYNEbTnLOQ6GQvPuuv0VkWkr
         oJ2JbzBTwEvLHapa97wIp8R4eQwskDDK92R3U8MUpatsDmFvK7oL2FPcvb1UVNT5v1NA
         o411BqNLVriwbLDXP2PdhRsN9iKyTLoXoUHuO9vj5/apRqh44NC69mtzs6yBOKmEWtF8
         qW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525550; x=1790130350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4v5CneiAAJU37Ea93Bpgw0r+62LGWh/ZxCVYmbedPc=;
        b=kaJ8sMY1/zy2mPoRFPhVaWXZ/w2nI6SN6cN1E6w/+3+xIcPD47luSJ9NQRQ92ve7AB
         Y03WRmE+cVcvEaCNnfObdCO2rc8bCNY9OzGHgNrBW3REFHW1cynvHZy/fSXikOiQz46A
         BwrcAH3lH6ccCDLvvJWD8XuL9mV4KEYp+NwMfX/euJvoelKHG/Jj6aenOe7n/lIQmQlK
         L7jWXGJaLZwfqqlIIO7xQ8cbEp76ykL05KxZuCAPYfp+w+lM0SqzFWcrd+Rgd6OEQhg3
         ULfk4EBbAID1ErYCMhlWxCRIqIEg7GKRS6BU5jXpOcAeYiXf5hEPTIbGLerwsAvoqcFH
         e6iQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX9XaQugpDbJ4bTwJfYwafwdXAz9knHS61GLnCXamwfZAnhHJQ+50nQqwF9Npgt+0xemHMRUCx/372@lists.linux.dev
X-Gm-Message-State: AFuF++ln7tYaXSo6c7Jk8r97KIS2o0iMYcOhIErLlijGyQtt8TZ1EyNb
	iecWQ7IV7uY194ks04+38UXpgmvNSpCD2wI8H7VL/OF6P0DJnV5jfFfvoxhvvBqH1/qM/IJujgz
	tyIYIFVnnQsxrqN0rz7/ypPfOtabctd7tQUeY6GE=
X-Gm-Gg: AYBFou1sj3+JyK6WaSjhJqEcSf5SBMQXdodrLj5FZgj7i57WixXRtNHYqL1CgN3q5D+
	/w7S749fdYPaI0Kb/ct38Ff9wA1KzZWwXRppMeJpKa9pY6hFMecVHp2wcFV3APkZMilY+pHgTWL
	MEHX/uigMn8lmZTJPht9WUJizpe0Q+TMm/H9cuzdAqK9btkD0SRB0KJez8WFgHWwBDYadqvVe/m
	oyJG6BaC/mZkxK+b1umUrOS23VRwgmJB2iH1lVWKDW/7kJXO7oBnkUJ/wXCynD8x65RYJlbKP/I
	RtxD+LitOySSzzN0pfbo3gjCJuKfgyiadOtLGckfx5Z5i5bP2dUxZOVGFqKjzMZkdSKwWcI+nAt
	WX3yMJKvZvw==
X-Received: by 2002:a05:6402:a204:10b0:69c:39f5:7e36 with SMTP id
 4fb4d7f45d1cf-6aa2242dc9dmr11519a12.0.1789525550214; Tue, 15 Sep 2026
 19:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com>
 <0b2d8858-b361-4a64-986a-4c179210fbec@amd.com> <aqlWt4jb4CSPnecN@google.com> <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com>
In-Reply-To: <d6179d34-a4b0-4548-8298-b790b333d22f@amd.com>
From: Jacky Li <jackyli@google.com>
Date: Tue, 15 Sep 2026 19:25:38 -0700
X-Gm-Features: AcwNN1XSdLAmVMpNGhlhvJVsI8al7B9K_71Imap5Z5_uyW4qm1svC0PFF6S2QLo
Message-ID: <CAJxe5ctcVxmhRSw3Gt0POQTzRKoxXo7+Y3CPDe7cUZvC0QPK+g@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:21=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> On 9/15/26 09:31, Sean Christopherson wrote:
> > What if we keep this one as -EIO (or better, change it to -EFAULT in a =
separate
> > patch?), but add a comment explaning why KVM needs to exit to userspace=
 in this
> > particular case?  That would be a good compromise; if the guest is atte=
mpting to
> > access non-existent memory, the initial READ will fail, i.e. we still g=
et most
> > of the behavior Jacky wants.  The only fatal case would be where either=
 userspace
> > really did screw up, or the guest managed to find read-only memory (tho=
ugh I
> > would probably argue that's likely also a userspace bug?).
>
> That sounds good to me.

Thinking through the sequence number and VMM bug concerns, I'd still argue
that returning INVALID_INPUT on kvm_write_guest() failure is preferable to
exiting to userspace:

1. req_gpa and resp_gpa are two independent guest inputs, so a guest can pa=
ss
   a valid req_gpa and a resp_gpa that isn't backed by any memslot to sail
   through the initial read and fail only on the write.  Exiting to userspa=
ce
   on write failure therefore still lets a guest kill the VM at will.

2. Comparing the two outcomes after a kvm_write_guest() failure:

   - Case 1 (exit to userspace with -EFAULT/-EIO): unrecoverable.  The PSP'=
s
     response is lost, and userspace can't rewind the PSP's sequence number=
,
     so retrying KVM_RUN would just fail that check.  There is nothing
     userspace can do other than kill the VM.

   - Case 2 (return INVALID_INPUT to the guest): the guest disables the VMP=
CK
     and moves on to the next one, as Tom mentioned.  The worst case, once =
all
     four VMPCKs are exhausted, is that the guest can no longer issue guest
     requests, but the VM keeps running.

   Neither is ideal, but Case 2 seems to be better: a localized loss of
   functionality instead of the entire VM dying over a single bad request.
   It also leaves the decision to the guest, which can carry on with whatev=
er
   doesn't depend on attestation, wind down cleanly, and shut itself down o=
n
   its own terms instead of being killed abruptly.

3. More generally, when KVM can't tell a guest error apart from a VMM bug a=
t a
   hypercall boundary, reporting the error to the guest seems to be the saf=
er
   default: failing the guest request degrades one service while keeping th=
e
   VM alive and debuggable, whereas exiting to userspace turns a single fai=
led
   request into a dead VM, and hands an untrusted guest a way to terminate =
it.

   And in the context of SNP the guest doesn't trust the VMM anyway, so a V=
MM
   that fails to deliver a response is indistinguishable from one that refu=
ses
   to, and the guest already deals with that by disabling the VMPCK on a
   VMGEXIT error.  Letting a host problem bleed into the guest is arguably
   "fine" here, since the guest is designed to cope with it regardless.
