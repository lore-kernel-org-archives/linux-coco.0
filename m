Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9344D7D25
	for <linux-coco@lists.linux.dev>; Fri,  2 Oct 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951869; cv=pass; b=MAn8z0/UBSk7BrPpbS2jXZ/7A0DwjXR7fAbASNoJOzoY+5hA1GGCmx8FXPVe+oUubu30Ykt9zgrk4Krs+3/9Frk0qBI6sW6qrEgib5m4v0M7O+UdPq6to8CIkKzUyjf1nNDD8QbQC54sqBPhQmagxlg9GVdSmrCvhHSdXsL0iiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951869; c=relaxed/simple;
	bh=bvtdEPxwSQXjnHdQcA79svDgXzwZQykpi2V56CMH9Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2EinpTwacIS2Wsie3BsLb4NYRHJFxIaHOpKh/o5XzkfbjT7tjDYW+1RwrsmnjIfXBIXTrQusLxpy6rfbZE/CCUg+RS4EjCfwFMaSLadb9YxVUpV5/P873nrkkIWToNc8dBxBN4lOfBHL03a0Denrs4cWHD0Am3COt37vJNy4ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R1xqvz3k; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R1xqvz3k"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so6659e87.1
        for <linux-coco@lists.linux.dev>; Fri, 02 Oct 2026 07:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951857; cv=none;
        d=google.com; s=arc-20260327;
        b=NzDze1Bk2aIH378V+0ImavbtDGP4dFtPuuvANxC+zK10oxwovHkAbwtT22eiQPTRn/
         9tP0X7WA0fbDAiUatT69Hdj99REajVcACFZJsVlpFSNAWeoMBPM6M8TnTscB2DjrzC0h
         AHeXbVFCfOUrUQPujTbSlu+07uBMZWMv5HEvKeqMtcR5LCGPRtwfRJLFf8Bl/EeFaC2H
         VsyqJ38YrBrn38odtctHbWldjjaxfL7zWy5Q56T4F1kMGGM7n/M/lU3tVCNT8ZnT0/Tq
         edEDGYIRyCrMFx4aTnoJEt0HQo55RTAky4Pb1ASQvJAd9pIekS8HBQfzDzf+r0AIH7UI
         mcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        fh=nGE5JG9WPsvEKV3sTbWknfbXALII7Lv4SeHuYPhYYqM=;
        b=hPY6Oyac6ve4aj8hkxAH0yEUGsU8FS9htklAX4Xz8m7HdLub9i80Y0J/4pILplDCse
         n7+xIiQXc7TXqhC7HQTP1vi0QVcHknn+rd3PSEJlw+7ATmCbEWOF0kmUSHNMRmoYx0kE
         D3ym5Oj9i/UEnJRFvVLXWARHU6NCvnV8e7/L6AMM7McPYtBHb1iKK/eF3PA4WZUNilo5
         yjYJyVezM79x77QUSOVR8h20Z8/Mesfd+3ZGm0KUOUF85upeb9AAfN5GN0hyEOV+4qAB
         ERKzBWefO3r8mXupKnmOK1a+YVVA1p2G0axpfjGFhbIs7N9PTr5nhGIll9yEVRgJyPfE
         JQOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790951857; x=1791556657; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        b=R1xqvz3ktffT4BMo/9L5nlwbU9edHygbQvrl2jM5PHWzTRRRcZEfpIfTGjsB8yNaKB
         eCyDu5OaMQtglP9VfYyt+mol1MwnbkEx4D+bVkoRYIDUzxJyzN/4S5HoSnVW5MbRfY3a
         D9zVYpHp9s4xyKMrJ79lQNz7A1iTfWooBirJG/q+Nuy1SO9iO6Vr+CtTIny7RhpaBZk1
         F9/jwACWqI3tmgFzAI5wfEVwwMSG6bf5JwDJQHzNgNbDoEplnuRuT6A2DydcQ63bGXXB
         8K4SWVQ+rndZe00FOIb14pZlpumSsAJstVwMS0yy3gBr0Gf+CWz+nQ1BhrE/Wgf2rJRf
         7VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951857; x=1791556657;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        b=Awhv0NwDi0W5WqhGlB9lLiGYcPUFramEZeVsAJsHkp2XXHdwnciaSRWzrMWM+aIz2z
         6MXx5s6xNJEQWOhg1puFdb4j6FHdYIm1jivb7STep42H4LXQFfo1cE8DJFvGQXUJnTdS
         FuQB5891HIcLznYrohTM+5z4e9J2TgN3a7w2D9DzyijE17RFebghcQxWk7VtLOZLmeeD
         h2Vvj4NexeoQYgNv9k2upd0/rldL4ee6T8QUFKCS/EvxN2ADPLle5FyJ2F+TUfT9/8Nu
         btNd6XaW0eZquD/apRN0VZ3YHoetgCy7LarwYusV7ySHp0138ZMLKzPOtO95fygjZH9d
         MXsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsGCuW1ou0VhMsW5RYbnH03BeJrvcT5kN3kObm1MUKqvLRhJkO0ydMsrI4wWbgC//jM96PIUu+kAjZ@lists.linux.dev
X-Gm-Message-State: AFq9FYKi/TNg8/heyICpZ5NXq0NUJVg5PZFr1oNtN2TYrEuPs+k5V9mr
	GzoP3ugbrmHjdNKviL7cO5kvHvrYnyRc0efTsXfeNvVp3vKghey9cjpBYaCFfgdXTZQmOLPfEB3
	afNEnOfy/3PKQN9ZlNyU2rnAIdXiTBzz8P2OdtstE
X-Gm-Gg: AYBFou0dp2l2FINMhmIBzn622wXchlpeFkXl3Cf2X1HGiYlyKiwLToKsc9rvFj07qXg
	YEzQLxNjNmQ8Q965X5Ye2KGBFya0M5tXCWvdp0XTHOSFQr9JJvJ2+tz+Yk+H38QYveKtyp+UWcq
	EyKJghU+tfxTIUKEs0yxhNWPZxUyyh1B3c6kdNaUhzqTuAJT61mB5aWVe+c0kmr28jGyCFFhoWf
	GuD/r9v5hQFD9ox0JpwjspvZXwLr35Zjw7jXQlzaf559TLkqnccvu5w87dqyAk3h3qcD6Zfp/Oj
	IbdMjSU9/9BrosRGm8BulZkZbemoeyW1cCvE5XGU9rMuJCmLShWbP9joLmtv7V5MOa9wXi7k1xJ
	huCScSRPEDuS1sA==
X-Received: by 2002:a05:6512:3da9:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bbe07ff87fmr127412e87.8.1790951856416; Fri, 02 Oct 2026
 07:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org> <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org>
In-Reply-To: <86pkxs2npx.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 15:37:00 +0100
X-Gm-Features: AclHuK_ts2oonb5gFFEThD7Rzb_QZk1ok5N5MoHVdkKoZ33EulrV9BUtxD17tPM
Message-ID: <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 02 Oct 2026 15:15:06 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Honestly, we introduce the flavor stuff to make it easy to match
> things on a particular VM type in a readable way. So why isn't this
> reading:
>
>         if (vcpu->kvm->arch.vm_flavor != VM_PROTECTED_PKVM)
>                 return;

I know this is a sketch, but just in case: that's inverted. The sync
only applies to non-protected pKVM VMs (EL2 ignores it for protected
ones), so it would be != VM_PKVM.

Otherwise, looks good to me.

Cheers,
/fuad
