Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F123B3
	for <linux-coco@lists.linux.dev>; Fri, 29 Sep 2023 02:22:32 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1c61aafab45so103090285ad.3
        for <linux-coco@lists.linux.dev>; Thu, 28 Sep 2023 19:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695954152; x=1696558952; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yf316/XBVsR2rQNYINbFH1RghlbSg1M9+4PRNq27GR0=;
        b=25DEe1tB2BaqZmLoHstSUPYfWGr5F23vIuXZPiG3Ue3dED6QDl5WDV6XnGa02M7e2I
         Mt71DrUMygVaRiyhBFke5ITowZyOPso7NXPevi6eLsBJaIxy+k6yUlIvbhOWzgLXj5Y+
         E8iYtOIcjcKUr+VCRaqxXJ25UE2IXIyvuXos4j2vJD22Tq73KmvCciRdU3sfMnWrmX5d
         0RmLkH9PpRJcub2K1XGjLvHEW0yDCi6f1NL76WEXGB/mNo38xl7p2u5dQAFc99NyZ2fR
         eTs6O1xfYFhM9hXRM5QjrM3rJKORHTZOb4dSbbAIf5Y7AcjpNLEXEULX3S4SmCQlsJnQ
         73tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695954152; x=1696558952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf316/XBVsR2rQNYINbFH1RghlbSg1M9+4PRNq27GR0=;
        b=jroMkw9eCuaQ/wycbpTo5rJIMajTB7b1WBzCR6vWdwvm/KcJbK5md3KC0aTwE+N+yT
         pfOM1O8H0iQnlhCNnGc8OWaPujOt+vcz6YBsZnvHgdJn+SYtlvz9SXshvpdYkicA6tv6
         bLK9d2hBFhHlT1zUc9nKp9GAoL9K+qnvVkKF7ftNRpbo0MZZQHPuED6uVju2Zn3gTP71
         wnYicTkmuexzQgsDJhVLsz6L33lTld7T+SpsoDhOFr8j47bO3flr97K+F5E98vVBI+WW
         muKyqvrKE2hTl8qf+LFa92uaTkC6Uzm6NvUNJLSsaj6EALEDqrnLf3soSCe1ik0fWxeO
         J98w==
X-Gm-Message-State: AOJu0YxpyFkNbOtp6bTyV4B3uUGB4M+NkeEldGTagEeS/j8VZI/wN77q
	Zd0kXqmbp7QTdvJoZZ6h05eQJ/FxwrI=
X-Google-Smtp-Source: AGHT+IGoCnhJr+jWjOXZIKjUlm/18Vs7CDf59VE0pa/+1DRGwwNlnGI+iJoyCFVb79rC5xZ6Afo79IEU3G4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:32d0:b0:1c5:7c07:e403 with SMTP id
 i16-20020a17090332d000b001c57c07e403mr37204plr.10.1695954151685; Thu, 28 Sep
 2023 19:22:31 -0700 (PDT)
Date: Thu, 28 Sep 2023 19:22:14 -0700
In-Reply-To: <cover.1695327124.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1695327124.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <169595360998.1385400.14024912459890362663.b4-ty@google.com>
Subject: Re: [RFC PATCH v2 0/6] KVM: gmem: Implement test cases for error_remove_page
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@intel.com
Cc: isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 21 Sep 2023 13:14:33 -0700, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> This patch series is to implement test cases for the KVM gmem error_remove_page
> method.
> - Update punch hole method to truncate pages
> - Add a new ioctl KVM_GUEST_MEMORY_FAILURE to inject memory failure on
>   offset of gmem
> 
> [...]

Applied the punch hole negative test to kvm-x86 guest_memfd, thanks!

[2/6] KVM: selftests: Add negative test cases for punch hole for guest_memfd()
      https://github.com/kvm-x86/linux/commit/e2bbfd5549be

--
https://github.com/kvm-x86/linux/tree/next
