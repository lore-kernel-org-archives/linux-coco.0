Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FF3DA5C1
	for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 21:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692453; cv=none; b=S79CtqJBQ5Axnn0QCPRwzN7sa7Iymn2oaEd4PFClPGOcjUP/mL9Bx124vwQ6qvTJLFFrxD5hJQpWKw6AUMqm3Phfl72WLGbp3/fNLn424lSS3cR+JaoNCXE/5BhF1up1KFjppX2uEu4gxv+HNlrO8N77e8p9CHXnAGBTa12Fxm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692453; c=relaxed/simple;
	bh=I2DW5EifHL/CwybK99JpVGsFZTmrr37j3nFaVNf5wZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iU+Hc7d+sUvIkdPmarIlknSh2ynsEGyH4tKPcd13PcHc9kkWIUkGqOfptDsOWIhGJ8DxIGiFebr76iIIj7nxSRkxEmbPsKfLkGECPfQx566K8w9Tt+HWeZrDWkQOqFooZXWgy3fwEK0NWuJw2sk/rENNkDMMKUM1tq7c/taooBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cCNGxozn; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--psalian.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cCNGxozn"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6c166bafcso4580225ad.2
        for <linux-coco@lists.linux.dev>; Tue, 25 Aug 2026 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787692451; x=1788297251; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5G2PRR2+LR4ebaBcqpexseLcg7M12gYjA5TXVATa8Mc=;
        b=cCNGxoznq47/svVjQF65G4+eBvccuf86f4Uk9ZoBTySxTHx31voTVNdj6CJafWHEgH
         HMmAUxwqm4oYM7eHh0qnYki4Q9Veupoinwo2Kav0YAC2+9H3zjv+9HIdmEdTqyTDZqcl
         adsJGmbTynEV0YLPfYxjEb6/P0VbWB5QNQbUR8bVtc7+E79oaHM3aCE//hB+4Q/Z/m5Z
         gdnkKc+/0/JuZq3dBAwBpRh1RIP/7muxz4KFEkCi+J905XE5tFuPZAOb4awzPrgsrEos
         YlnfNphNHyW0tahCuV/o00KJvZEzddZUzkYe3yqWQa+E+t6WqHTFhona0BEdFB5j0NMq
         NNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787692451; x=1788297251;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5G2PRR2+LR4ebaBcqpexseLcg7M12gYjA5TXVATa8Mc=;
        b=k5MfthqzgqlIph7vY1ucwmMtce2lrwjit7i1sScru/MS1u0i7orTdGPSEIF4r7tlHa
         GSD0X+cwofgXXWc/VKL+pdimPo2reOwRYGa5JkDh8LhD92jOst7rSLJ2cSFv27uv4TIp
         CCdIzb5UCaCD0kMIkYwn84ZKMhwCjssOZfGMH3V3cqA7Xb0Xc07KAawPmnugzWSwKWp9
         poHZEKTeGHt5dC41mEscNQUnzdC5dcglMK1H+gcDrwfgzZR3+5JQaq75ACmK2W0tPjwn
         NQZ8+L1qF7DSeb9NKhX+VmCEPxcpKp0L4CAhNaRt2KeMhxChODy3nzV7zmvJAphR5zss
         3YVg==
X-Forwarded-Encrypted: i=1; AHgh+RqyoKhYOD6W8b5kCuse0OWm/rKllaZ8VeMIkwErqUetSifnqdxRcGXI8uyGg0oKWcgBxZuLpvP/p33I@lists.linux.dev
X-Gm-Message-State: AFuF++kdJqfabbe21EPRUWXEmKOtJODCPkp7pSCYSAnBVegRa5NRFZna
	D4jnYwTImjb6P+ZCZxnX/9sp8OAgdRZMWxmbxX0b9IKFImX16RMGutiap1ZpXlAhqocEOZaUeHE
	5bdrJRSBl1w==
X-Received: from plhk3.prod.google.com ([2002:a17:902:d583:b0:2d3:a560:c1f7])
 (user=psalian job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19ce:b0:2d6:f6ba:263d
 with SMTP id d9443c01a7336-2d707aafd1fmr20811815ad.7.1787692450793; Tue, 25
 Aug 2026 14:14:10 -0700 (PDT)
Date: Tue, 25 Aug 2026 21:14:10 +0000
In-Reply-To: <a877fa95-4cb4-44b9-b123-5d9084fa4e65@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <a877fa95-4cb4-44b9-b123-5d9084fa4e65@amd.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260825211410.2805027-1-psalian@google.com>
Subject: Re: [PATCH] fuse: mark DAX VMA page protections as decrypted
From: Punit Salian <psalian@google.com>
To: pankaj.gupta@amd.com
Cc: michael.roth@amd.com, thomas.lendacky@amd.com, miklos@szeredi.hu, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stefanha@redhat.com, vgoyal@redhat.com, linux-coco@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Pankaj,

Thanks for looking into this! Yes, that makes sense - virtio-fs DAX support 
(the DAX window BAR) was developed in out-of-tree QEMU development branches 
(e.g., https://github.com/rhvgoyal/qemu or https://gitlab.com/virtio-fs/qemu) 
and was never fully merged into upstream mainline QEMU.

In our case, we validated the guest kernel DAX driver on AMD SEV-SNP and Intel TDX 
hardware using our in-house lightweight VMM coupled with the standalone Rust virtiofsd 
daemon. Other public VMMs like Cloud-Hypervisor [1] and crosvm [2] also support 
the DAX shared memory window natively.

I have posted a [PATCH v2] to the list incorporating your Acked-by tag.

Thanks again for the review and assistance!

[1] https://github.com/cloud-hypervisor/cloud-hypervisor
[2] https://github.com/google/crosvm

Best regards,
Punit
