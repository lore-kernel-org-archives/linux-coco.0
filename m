Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5021B1BC
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551568; cv=none; b=MEzzqi/NLqzWZx27Ovk65hhWdfHJic9JRQ0fdS3Xrax5pTBGryRETCihBj6/f8y+PXZafLFus/ZTKSn0iG8RmgkSXmeoRJpGZqEpQpt4N5XJLAO7MxOpF7Vp2Bf3zQ6dJNayeHPxps0Q9nXWbUVdOsdyPbn3oAVEY8VKgkAD1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551568; c=relaxed/simple;
	bh=1bryxJOQhO864UsC08x2e4pfQ16czs/w8bPQoDXjSjs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ta9vtcyzYXxVtloF84ttg+Dy7wxosGupDrmNMGDhCOhHzzyiSEXecO76e8oviijgp9NOzqb8JK9hcW4GrraiZPVKFoUY7wNZCgZgB/Vgc/F5chk0jAVW826umK6DhubH3tkljSvsap8rwwT3hLDKsL/9PqTOtOZk2y5LkNKAmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hgLn1/ut; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hgLn1/ut"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2699ed6d43dso113466095ad.1
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760551566; x=1761156366; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOeXfPOI+VxLjQAjtdmu4bcvJNLddQyhHNA73veAbMM=;
        b=hgLn1/ut8kFKk88iCXLtG1+fNtWOXxXeINNfQb9OdRA1zqys4udh44wWuGeaxW01hD
         tdI6butjXbnFLEAnj8ojiNrIYoHw/qkM4HnG81zIMfKhepdHUubjOy3f5NMQ6NStYdKj
         xphlzLjQaW2uyuN+dma/S5q3ibCSnHfW6B+UmUFeXrUivAG4NYE7TqhTVILevSKzbAvY
         xdcUXf+cYSkqxNWh3ecm/tZxUji2vluUfL0vfnOOlKo1Jznd1EsD7gdEpY3dMbyOwYM7
         twOEtKkllNF7lNM3szXjAggsazlGXbdIAjvlmldS3gLoCQQg5H7/RV8XMPAT47Fg0Ecj
         5hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551566; x=1761156366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOeXfPOI+VxLjQAjtdmu4bcvJNLddQyhHNA73veAbMM=;
        b=mYDowx6hmOa8RQ7+V4t2YVkFkFcrplVnmVAsop8nI22i+ZGpOA4eZMcT1OCb7UVsB0
         ofsHulxnKGDXCMK5K8TV5zA8CdH1393yThJ6nW4C0XVZKdR6nbOI0BXAOlsJECMc5D/K
         xiGQxD1XloeObVMPppgWhavlic/9I4Wgz2aXScdqBFx2XKFF0hk7JU9pJkQd9pE8YJp1
         SAcRll8aFZ8FyMyfiqI05xFvZ/u6K51ThYD+TXI4ueGK5NFqW25PuwtfhC/vtnhvhMSl
         zxnih4JJ7/zUxHh9t5RY7rGRGfsBJ9FTrpEUQ01Icz4hQqVY7j9xSKyHS8j2ijf7+w40
         sv1A==
X-Forwarded-Encrypted: i=1; AJvYcCWDixoqrE7+V8kqlGYJ/zmQvipjaeJ4vvnShJ9O6Oqjgtg9FUdB6XlJ+41mWxeGeJCEPFZLNkPHpycK@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6NBQASPW113uL7L2DJ3Buh+0V87VSltf08UnJLr7JQluTzpJQ
	XO+i+KFQt3JvHVStSzpzafAz1uMDgg1Pb/jUP2LV5cUq1Wy1DcV9o66hnHVfiLYDo7dZSKxZEDK
	nVhw29A==
X-Google-Smtp-Source: AGHT+IEpOVmIF0rT/UXzrfG/ESvOYXUtPYXGtAYd1hVrzdqGcp2E9cP1LU6PudKUBZvyIZJcbflHrLgmriY=
X-Received: from plty8.prod.google.com ([2002:a17:902:8648:b0:267:ddd1:bc97])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a8e:b0:24b:1625:5fa5
 with SMTP id d9443c01a7336-29027356c0emr348628335ad.11.1760551565985; Wed, 15
 Oct 2025 11:06:05 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:02:46 -0700
In-Reply-To: <20251012071607.17646-1-shivankg@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251012071607.17646-1-shivankg@amd.com>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <176055115910.1528299.15660583671377559341.b4-ty@google.com>
Subject: Re: [PATCH V3 kvm-x86/gmem 1/2] KVM: guest_memfd: move
 kvm_gmem_get_index() and use in kvm_gmem_prepare_folio()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, Shivank Garg <shivankg@amd.com>
Cc: david@redhat.com, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, 12 Oct 2025 07:16:06 +0000, Shivank Garg wrote:
> Move kvm_gmem_get_index() to the top of the file so that it can be used
> in kvm_gmem_prepare_folio() to replace the open-coded calculation.
> 
> No functional change intended.

Applied to kvm-x86 gmem, thanks!

[1/2] KVM: guest_memfd: move kvm_gmem_get_index() and use in kvm_gmem_prepare_folio()
      https://github.com/kvm-x86/linux/commit/6cae60a1f507
[2/2] KVM: guest_memfd: remove redundant gmem variable initialization
      https://github.com/kvm-x86/linux/commit/54eb8ea478b1

--
https://github.com/kvm-x86/linux/tree/next
