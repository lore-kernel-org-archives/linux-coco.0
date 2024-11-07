Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263321FD91
	for <linux-coco@lists.linux.dev>; Thu,  7 Nov 2024 23:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731022147; cv=none; b=IzqhpbvTphrlzPI2AazishGdPZAQ3cJzTWWudwcQgRehU/sEGaUpfwUF0tj/TDbN6wJAoNr40CluEN47aeNPJrCHLooMzPEX6Wmg1ajRe4Nw76WyOoGoxpJ+i+dxewybq+1DIb8K+/RXx2A1jRc9mYCoc4Kd/yHpeQamW5uTysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731022147; c=relaxed/simple;
	bh=oDf5npMGctxHpj3CKUaehkTMFi9Hydj7j17liXjYHhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JaQKnFeypQyab/mneEqzvSfWUw2EWOuTUYqZtQhnMorqp2gA4LVgAt+C+SmYrZfb/73IGhZ9jg8KTpgAyNDCyttabadpw8Y6daP9MENS5Trj3IUlyITlQdboaIhzjUxPL6KqdQUa97oGsLgrkAp3p5ZsHye7Z+Xnk3K42kHwID4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nPmqntQE; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nPmqntQE"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e30d7b4205eso2392143276.2
        for <linux-coco@lists.linux.dev>; Thu, 07 Nov 2024 15:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731022145; x=1731626945; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4EqUUsFU0J919p2J42QwMUZuZnKtrumICd6dLkgNZs=;
        b=nPmqntQEBRNJNy2cr/xCF4e+sWDEZA5en2WQEDFIbIXtFZvgbvofAMIANfjaFEGTZZ
         3BqfPcg0HSN5ejd4KAb0sprHzsJAUl5wym7JI3XSTbQclLpf2sVw00rTn187S7fUAXsu
         Rv2RM03eSxg9SfD8cnZNA1eGCNj35mTtuSZYHYFG7qWmAfY82rHQ6JGylvNnRHHDA5kv
         Nk+ngiylGvZflz0veuDjn2DDANi1WltVkNLmPGALpQVUFywvXnzK3du5hOhF7UVWh1GT
         +tLCrijgHZhK8UlSCC7SC7L9x0F44e/IvTX5PHBYt2IId1U6pB7WZzM9EiZpwmjwoPvC
         DQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731022145; x=1731626945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4EqUUsFU0J919p2J42QwMUZuZnKtrumICd6dLkgNZs=;
        b=DZss2x0D8g1lTKeE2nIuqCKuSiewUrlogvFv3mSia4Y4VxLkEWp8k3cwUlj2riIaYI
         6cug7DObqx7er1/liU+A01BWpl+EA0awD7hrNFY/oUQgr+7lIoo8zruzvNlGgP6Pk8nr
         tunz5UxX+TETxPXAI6guLWmJfU4Ry73/2Bom7U9Jmu8vk+7ovWZkp4tyQ3d48RNmpe+L
         FN/jStyfEO+9UFkWnN0QzUtUSzgaIU+U1Sl+MNP2+FG95hQPwj3bLn+GN49gzHNR6UFb
         NbSomCLb2DsyThrkiDQjpqR2pWrYHLNi996gAbcUCo7Cf7C4YVjkkl5P2yZkwr8u9IZT
         pPeA==
X-Gm-Message-State: AOJu0Yz2fgtGaQxDXUdQI6UwhDZ4AwG6RoI8dKjLMjHV4zjxl3ew/Stg
	wFestTkWDxeppwW0eeFNRj/3MKIAEkje6IPCAm69MiXP90/kFx/iBit1ifHzMVGUeJ8f0iUpi0k
	Qi3zum3OqbViQWVrUC8n34g==
X-Google-Smtp-Source: AGHT+IGrBfMJ43qCU7+eNDzkJD2pCLgwnrrbQ3tGEDXhIoI6iYi0P5BCV+iCp8PyeRrxNd5WKW1AEJAk1vzAol0aBw==
X-Received: from dionnaglaze.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c9e8])
 (user=dionnaglaze job=sendgmr) by 2002:a25:add3:0:b0:e30:c43a:d36b with SMTP
 id 3f1490d57ef6-e337f8ed8b0mr579276.10.1731022144758; Thu, 07 Nov 2024
 15:29:04 -0800 (PST)
Date: Thu,  7 Nov 2024 23:24:50 +0000
In-Reply-To: <20241107232457.4059785-1-dionnaglaze@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241107232457.4059785-1-dionnaglaze@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107232457.4059785-11-dionnaglaze@google.com>
Subject: [PATCH v5 10/10] KVM: SVM: Delay legacy platform initialization on SNP
From: Dionna Glaze <dionnaglaze@google.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, Dionna Glaze <dionnaglaze@google.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Michael Roth <michael.roth@amd.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tianfei zhang <tianfei.zhang@intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When no SEV or SEV-ES guests are active, then the firmware can be
updated while (SEV-SNP) VM guests are active.

CC: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Ashish Kalra <ashish.kalra@amd.com>
CC: Tom Lendacky <thomas.lendacky@amd.com>
CC: John Allen <john.allen@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S. Miller" <davem@davemloft.net>
CC: Michael Roth <michael.roth@amd.com>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Russ Weight <russ.weight@linux.dev>
CC: Danilo Krummrich <dakr@redhat.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Tianfei zhang <tianfei.zhang@intel.com>
CC: Alexey Kardashevskiy <aik@amd.com>

Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Reviewed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
---
 arch/x86/kvm/svm/sev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index d7cef84750b33..0d57a0a6b30fc 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -444,7 +444,11 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	if (ret)
 		goto e_no_asid;
 
-	init_args.probe = false;
+	/*
+	 * Probe will skip SEV/SEV-ES platform initialization in order for
+	 * SNP firmware hotloading to be available when SEV-SNP VMs are running.
+	 */
+	init_args.probe = vm_type != KVM_X86_SEV_VM && vm_type != KVM_X86_SEV_ES_VM;
 	ret = sev_platform_init(&init_args);
 	if (ret)
 		goto e_free;
-- 
2.47.0.277.g8800431eea-goog

