Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F10D448D0C
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 21:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975493; cv=none; b=T7sPKiyOVLFzc620fJxNuBCuUeV91qceL8wOYna+E2uM3TH6qQNVWT14ttAvx56EBM09cMdS8jEbzha4SNFHJJ2zXKIM4Z6kgV0NA2IANlGzoXYvEBm3PNuAydOFQ9wMkKC8//QBOF2BdilzQd/5wmWaAZxytoJJ0pkIIUSW9z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975493; c=relaxed/simple;
	bh=7HP8j0vRbaMczyRcR6MqI5PEt57F9XkP6W2Sf05zWDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rptY334p7YZ6WPpY8Mgbxz7mK1jY8g8oZC1rOYeKnaEh011Ow8ShUIT+yV5o/tRNxhqNbkQ0qrqzoQ1UFtCJqfgemh1HvQJCDi5987uTDgKiDksPqG5UkrFxOt+lnZ6GdOtXt9SQHt5CQGyXElp2xosdjwZdNQ+dUV7SJpuFLUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F43M8gAJ; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F43M8gAJ"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so9174a12.2
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 14:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790975488; x=1791580288; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQy8amvB/kaTOh4AUTfTq9TAn2udFtua6zNz9l0R3d8=;
        b=F43M8gAJSQWBxOU+2xSaONmpVj3lKbJ54Ne3mDIUeaK2+NZy9ATkOntYJC/6cZvVJ6
         VWPAmde4xamY890m36kDsJAs6K69XTfDgVDaQ40eJ/vPhaKc3ctDM0//csCv5Zpzr28i
         6ZOfwBVHU2Fswyc8es5/8CGJFs+LXlBvzO4dVB6SjZ/Hvht8JO1AUTvYGR3ynUuHQax1
         /uMhIVwijfZ4lxjBEyKX+npiRauz2gV2Gl4fiBZ6/S3zi9+b1F3DeVnoinsKfxmG7TmG
         6Ry7DtA3asYTF4loj5jjSRl3dqE6g1x1wfiVmntM4Qb6ys0gXiRMY8Qij+AWMmAeGnho
         0zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975488; x=1791580288;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQy8amvB/kaTOh4AUTfTq9TAn2udFtua6zNz9l0R3d8=;
        b=Q/ZUAz/oSMK6Lea60c5BSmEk4vgy8+1roUCkuQQVQMEbS/1U60hv2yF7/V9YblrcWj
         VAiw1hEGPwLIvygetWsmeY+1nnDZZR5YKfSlz11IvGrtk3tdwsHHPRnw3t3n8b8fpqte
         gmebGKF9KeJUmNB8g9lINwpmpMh9N6t2lNTdwN1PTtfIkootXXnhKPr2C94VVMwBgg4Y
         b0n3XW4cBGuK3ZbburVDAtQzFjqVA3ucxVXPuXD3ZwdXhKEgwiUTYelv3G29LJU+ZSzO
         6tWhCPm71//JvtAj+WBnWiokAKxC3iXj0V84eocOIwjzCW1aNKZgbr7ejG4shq6mOwF6
         rHVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqT9bMdP7LCSSpzdFEIsV1Kaa0wpfFg7DWJeFyJrKly9IsZxa/g2ZTGm+3XEcC2BLNb+KxmRiJIxAK@lists.linux.dev
X-Gm-Message-State: AFuF++loE1hKARuK3s3iYrrXtAlqHxm5W2+YGVTKHojWnL0oF+m9g8Ul
	dGyPbpvgYGcCQY0xoLz5VKNA043DPRyPto/rcf0FTODyVnUwbX0Rtc+/rKK3xxkXExrjw70ibYb
	IaOyl0A==
X-Received: from pfbhu50.prod.google.com ([2002:a05:6a00:69b2:b0:88b:55f8:60eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:ed0d:b0:3de:5a00:e248
 with SMTP id adf61e73a8af0-3e0bd479eccmr4003281637.76.1790975487779; Fri, 02
 Oct 2026 14:11:27 -0700 (PDT)
Date: Fri,  2 Oct 2026 14:07:32 -0700
In-Reply-To: <20260923-snp-invalid-input-v2-1-c00e0dd077ca@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923-snp-invalid-input-v2-1-c00e0dd077ca@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <179097473116.4069804.1607082912708388223.b4-ty@b4>
Subject: Re: [PATCH v2] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer
 access failure
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, Jacky Li <jackyli@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Jacob Xu <jacobhxu@google.com>, Supraja Sridhara <suprajasri@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, 23 Sep 2026 20:18:12 +0000, Jacky Li wrote:
> Currently, snp_handle_(ext_)guest_req() returns -EIO when
> kvm_{read/clear}_guest() fails while accessing guest-provided buffers.
> Returning -EIO causes KVM_RUN to exit to userspace, likely killing the VM.
> 
> Fix this by returning GHCB_HV_RESP_MALFORMED_INPUT with sub-error code
> GHCB_ERR_INVALID_INPUT to the guest and resuming the vCPU.
> 
> [...]

Applied to kvm-x86 svm, thanks!

[1/1] KVM: SEV: Return INVALID_INPUT on SNP req/resp buffer access failure
      https://github.com/kvm-x86/linux/commit/003892d6e802

--
https://github.com/kvm-x86/linux/tree/next
