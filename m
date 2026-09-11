Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3488A2D8378
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 01:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088438; cv=pass; b=ndygW/IZjNBTlbCZQHdjW7Yu2e0O1yUNSdfVVGtuxeI862ZtSwnBH0Pt8PY+Qpr62+GCQVT9yN5EosrhCjYK2E+6RY/SWeXOxZ/6nRdzVBuBh/sHkFE1Vci31Rrn7ZEmUdL+ss5eLR2//8BfwSIT7oQLkxgQ3zRrakrirewUYmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088438; c=relaxed/simple;
	bh=cm3sMjj6dg/Ij/Ch1aHvmiK0QfwA6u8gf3sSA0DKTl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fhx4XUXlkaLLIaWyjJwaLx4RHWbEh8BD/KBRxWnX/uPBFFWvgW6CjZzheb7KqPsFuf7ZCWDqr5MZwIayMyWU/xPYebc+fntiPpXQk8Blgu5Bh+iNXEDlbbyHX/Zf12AriOfxxpB9tLb1sJrnBiLhONIPLQIDcMf4y83QJLReYWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RKvPnUTT; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RKvPnUTT"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so2531a12.1
        for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 18:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789088434; cv=none;
        d=google.com; s=arc-20260327;
        b=AIaqx9W8+bJ00YCZ1Akl0fGaID2JoXsZK6cMZo8jYkASKek3uilIm5dMtg1k20b76G
         KZ9bXOI4mEkYhue+MfNh8Wo89MNiS8iALA5GDD+iA1JMWAdFt5KMs3EEKL78DQ0tkkLE
         I5ycYM4175CC33ZC+siM5JK8BPq+6KWEwqWn44qKLjAU7Bx1cB3lUpRoj/S2oy3MMdIE
         FqTyh4bcZW3TvFRxq/t80Fcd4Ts3YvhYhCpHdaXvdv6K2bnbexJ4cXtZZu1ploW2ZOWU
         nblmGtsY6hivrc9gACbhp4bpYSCT3OXSSUgKREi3UOYHTDqTKllr76c90LzCuFRBZ+UL
         uq8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9W7wf5Z1q//5NgqTWb191yrPA1yIRBuapqyaZSNqGrQ=;
        fh=jkGcbMKOT1swjXzCPz4iaVikAA17zpV+wVdYuXnfz+Q=;
        b=PsBxbGljAJJKcEa57jWm4APFg49j6yXt5nDRTzr9VBsjXFs50iiP/gaCAp47DaZ5vI
         lCsKpLzziAZTnC/oMWHgJYPx5GHuCi1tmQ408SkUowA2Dm0ewGoYFLp/u78oc0El1zqn
         VRqt1b9BVoUrX1xLXBrvhJTM8lbXDjEF72MEtnMs7LSfI68Ohnb3GB5uk0JbrSNn1eeH
         1eC5gP97v8AGKLNvDoNygeLS5zMf6WVePFiF1cMRprU2QRPk90czkEGeZvlxbGox5YBQ
         Bu9lAojNrlLr2kGNEk/4Agb1fUFV1EEtsPD7Xvm3Kuh8I0Tq13/QNmJfYrILxLZyBQmT
         RGdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789088434; x=1789693234; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9W7wf5Z1q//5NgqTWb191yrPA1yIRBuapqyaZSNqGrQ=;
        b=RKvPnUTT1RfKM05Zla1P/YjDpV1iY2P8ySAqtxss2ENfhI8zlzEoCuo3omss7nYRX4
         fEqI9Rr0SrcrA6uw8dSe8cXFlyLo/VTpEeTrEJXPpEK/yhbXpsYO5tqyj+fHV43XszYZ
         I88rVR0YW0m+xii39a8b1Sua80ocAtOGFaOQu1NY4SWiXpXZjdl6ohhZtqJ79319teAT
         tL6++/VVoU5PcanguC4QGXlLnmuzd0vJMjYaeLuNaLZBZC7aHzt6sgm1609cU1dzaUiO
         KnJ1gQAdGL0h5t7SZhiHWuBLCsiaCZQCyb3rPyQCCtrj9r4MdPMwoCO/g0mWKRwJjygh
         aOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088434; x=1789693234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9W7wf5Z1q//5NgqTWb191yrPA1yIRBuapqyaZSNqGrQ=;
        b=hbr/EBxj+0KKAOG6DFGveUCEwuUyj+TqjhTjZ3iSwQGF6S280Zr9dv+jor9Er2OJD+
         be4OOi4WxIyeUzVxp/D46R4AWNOR8DokEeRtQ5CNTi5+EiN2xxKvZHcbQUshTmhFqA2l
         IGgD+QIHuoGljaZ59wjM6SGgxde4VeZrHpgqq0JEsgulY+PdsiZ0Idj8BVSl00OdApr1
         PtcGH4enGkGG9IvbxCdqUWpFv6aFyxyzucJpYa2dCWIIEOpjU/3vh+i1k2sOi6gsh4lD
         oAltLDFD/PjFZ02J2BH4ELl0z9K44+kle3hl/KqPxFcEXSCK8AJgcZwXHarT0dZkNsv6
         zjzA==
X-Forwarded-Encrypted: i=1; AKwUvBxrEX9t9lYTnQReSs+Mef1rnUuMG0/m1XTT+P5ZQ9hU+00LkvlnPQcuvEqnpL5h2gKw1LXZnlFyp+LR@lists.linux.dev
X-Gm-Message-State: AFuF++n3FMnbPMgT9+qgYuMQ9eTVeIJVqOgo8YmG2TovHWeP3iDgpv9U
	Xd55tfTQlB2ordv2tmJKsuaOgE9XZNM50nk1QCBDbfdgpY4HyfYOzkCJwnhJ+UCf9cMT17Xc4dw
	yeqSyglzLa6alniFu8Ixo3jHWR3sxg2qttsdsM/k=
X-Gm-Gg: AYBFou2DN6fk3+JEhg9sG+NPPXDrzYwaNb5obayHD6GUMhilIbhOCWi8jyAAWzmAVq8
	DpyaX5HtkqWCgDyyrtnmsZQs6gumDo1MXEwUu88zmZR0YQuSurCzZUKbVfGugdMZFsojeDcB6kV
	oFgSMSH1IKxO3xH8q9Tlp9ttpbU6gK2U9Rz6Q2nP8DnHJ5eJxNWws/qa3sdzvLovUH558vtvKfr
	kGIg/278CQ46rgR2xoiKHf1jaRQ+OeHVFBsAW1XjMZYCLvY2f+yrJravBG/+cjpPu9J58WelWd1
	4TNkeyuLT5hfed3RD4HV3WzrRiiDaBBhwJLOAgUqOBApQ0v7SUXMqJ+hrHyxvinYNdKIHbCOy/0
	zrhAYdqhgVjo=
X-Received: by 2002:a05:6402:424d:20b0:6a4:abe:b08c with SMTP id
 4fb4d7f45d1cf-6a9b57cb410mr21122a12.12.1789088433597; Thu, 10 Sep 2026
 18:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-snp-invalid-input-v1-1-fb2e03da614b@google.com> <aqM0RIiLVqvwit-w@google.com>
In-Reply-To: <aqM0RIiLVqvwit-w@google.com>
From: Jacky Li <jackyli@google.com>
Date: Thu, 10 Sep 2026 18:00:22 -0700
X-Gm-Features: AcwNN1XUgXbbn5nwS_6gLkiHnK1ioVC0BuqHuY5_oGbYdwxTTcUgR_nTxyMVzt8
Message-ID: <CAJxe5cuFaodQLcKvSTytobb8hszH+YhPpvoQ14SWQpqh-2986Q@mail.gmail.com>
Subject: Re: [PATCH] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Jacob Xu <jacobhxu@google.com>, 
	Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 10, 2026, Sean Christopherson wrote:
> When stating what a patch does (or doesn't) do, phrase everything as commands.
> Passively describing the patch, as done above, is problematic as it's not clear
> if the changelog is talking about what the patch itself is (not) doing, or if
> it's talking about the side effects of the changes.  Whereas this:
>
>   Don't try to validate guest-provide ahead of time, as such checks are prone
>   to TOCTOU races, e.g. with Page State Changes, memslot updates, etc.
>
> is more obviously talking about the patch.

Will do, thanks!  I'll use your wording in v2, with s/guest-provide/
guest-provided buffers/ and reflowed to fit two lines:

  Don't try to validate guest-provided buffers ahead of time, as such checks
  are prone to TOCTOU races (e.g. with Page State Changes, memslot updates).

> I don't love that userspace VMM goofs will bleed into the guest, but on the other
> hand, KVM already uses this pattern for Hyper-V hypercalls (and worse patterns
> for KVM-defined PV features), and practically speaking this is better behavior
> than returning -EIO.  So I'm good with this.

Agreed, it's not ideal, but KVM can't distinguish a bogus guest GPA from a
VMM goof for now, and killing the VM is worse for the former.
