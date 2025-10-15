Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB752517AA
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 18:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760551793; cv=none; b=gjTTqCMfAgWEIbQkNhyPUki9H2G/ueRDVHeBm/L7c5k72u9MpswTIVLrm3QWwTH4elhWUfEo4ZZlOew4nUsvfTbp8ksEK49gFuBYzcZV3ebfJcrfaiVS0R7vjcHwfxiFu6lJzehTQJYZeqOz9xuszAxANMY5TJxiZtd+rDq+Z5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760551793; c=relaxed/simple;
	bh=5G6xDAhFH1AxSP7lDNMOG9A1FxSEBhHl8BnZzEQDZEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e9XLu90LaoA/wkvYMRj9OMbv4KP3hfWWBdnBNPrbUP/EhNGfjJVD0b/Bbo23OBSrE8Q0XegtmWQcoovlSLfbbSbMlOuk+AuHyxemN5+8uIgKBaF8G1s50+9iHtCN4YLJeftXiZt76k1X6imQYl4dXTt9WvAn2syjqbG8QXLx0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z75jhj32; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z75jhj32"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7811e063dceso9808718b3a.2
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760551791; x=1761156591; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BBZAV7j+GFJDsPwRiVv1D95p+t7S8aVLW4yZ4s5Ojg=;
        b=z75jhj32+KA4HrulNrCMEwaug9PaS3FUgvBUtwUd0peW6L4vWIJvwewuTv5G9w6F0/
         n2gTTOLWttdUIOTmeIz7dA1xl4TGStaHlPdQExL1IVume04Zkz7yNlEhtMOsEoXyZTqB
         wEEoNNY6dZat3sFFXwc+EAc3Ew3NSXMdBgVNnzGazgC/8mhp8mG+ERQZDGvX970PUNXJ
         c7iAt8fghxxqzz31+ePsWX/3V+UJcRtXacNDE9e/0MFd/qWnV2+88GUTjzKwmNUIDLek
         v52JSeUS6IkBI/Hxuey4mLIRT4ttf3hwqm1CrMrYLET3p64/PiL/EUBOhFJ4pQ0EgPg7
         Oftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760551791; x=1761156591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BBZAV7j+GFJDsPwRiVv1D95p+t7S8aVLW4yZ4s5Ojg=;
        b=vfITTi/pK85s2nsoSvIILzn3tUZ3zu55ZDL/gylrZ628197dW9qYTFJAqvEnpZ+3O2
         L4xRHLrK4NGA4Y2O/swJJXAyF6SjqltATuRVzCZR46iQ2HPIHdz+w3ybBURwFTjddvbo
         jDyKVdtjaTEW13/4dQ+m9X9NkstKjrphY4JH3AFnU2qBkZ3/tgzXmbyiqxPG74QyptL4
         WUPQPOafpcz78mrieD0pIuzmFW+pVphQI8oFJ2QJDNWL94g92GAboKp9MlHeKaaZC5Dc
         2Kj7Lal84s5px7pmIsX/vism7wFgyh0q/DtOGbWnZMFyF1HOFscyG3ucJl/N1amMv3Ij
         dDEw==
X-Forwarded-Encrypted: i=1; AJvYcCVDnS5nnvCwixaOxq0BillGvXUwfXhZKE3IM3LBxFMH8QFDkWfUKR91owDiAc2DEl96JxVhOIF5NtgG@lists.linux.dev
X-Gm-Message-State: AOJu0Yy22wfjepSUBlvMkfAA82Xp+u+WiRu/HRM7TxIyeBarm5EA7/ff
	3A8Gi9Ble1v8Z0wcz0l0Dwznb7/Z+L4LNnbpk9H/CTk0jtlE9BVvC2vAa2NJOfDXnSU7/Rs3svo
	7A918mA==
X-Google-Smtp-Source: AGHT+IEVBqMd8BR36sPa9T+x8P6NqfIxNzMog2AuHoV3bAHdWnsbVuEcYRmkXJ9aUZJpynYhCzcjtMqxO3k=
X-Received: from pjbbr8.prod.google.com ([2002:a17:90b:f08:b0:33b:51fe:1a92])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a29:b0:304:4f7c:df90
 with SMTP id adf61e73a8af0-32da845fb34mr38836942637.50.1760551791139; Wed, 15
 Oct 2025 11:09:51 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:02:56 -0700
In-Reply-To: <20250916213129.2535597-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250916213129.2535597-2-thorsten.blum@linux.dev>
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <176055123341.1529540.17733052766097672792.b4-ty@google.com>
Subject: Re: [PATCH] KVM: TDX: Replace kmalloc + copy_from_user with
 memdup_user in tdx_td_init
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, 16 Sep 2025 23:31:29 +0200, Thorsten Blum wrote:
> Use get_user() to retrieve the number of entries instead of allocating
> memory for 'init_vm' with the maximum size, copying 'cmd->data' to it,
> only to then read the actual entry count 'cpuid.nent' from the copy.
> 
> Return -E2BIG early if 'nr_user_entries' exceeds KVM_MAX_CPUID_ENTRIES.
> 
> Use memdup_user() to allocate just enough memory to fit all entries and
> to copy 'cmd->data' from userspace. Use struct_size() instead of
> manually calculating the number of bytes to allocate and copy.
> 
> [...]

Applied to kvm-x86 vmx, with the aforementioned tweaks.  Thanks!

[1/1] KVM: TDX: Replace kmalloc + copy_from_user with memdup_user in tdx_td_init
      https://github.com/kvm-x86/linux/commit/0bd0a4a1428b

--
https://github.com/kvm-x86/linux/tree/next
