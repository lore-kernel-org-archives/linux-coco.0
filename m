Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2B3C0F
	for <linux-coco@lists.linux.dev>; Thu,  8 Sep 2022 14:56:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id i129-20020a1c3b87000000b003b332a7acbcso1198682wma.1
        for <linux-coco@lists.linux.dev>; Thu, 08 Sep 2022 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profian-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ryNqK5MU3hvexcP0lqXzZYDdmqazm1TBDaWSc1Bec88=;
        b=A+h3uk/z3zVLJRHckmNM4YxWpnH5mOtpniwEZgYBiShH8dX2ke8mlhluujBLTZaei9
         rjyudPZLRVKoqa/kHk9XhTDRWTKV43CDnaG0QLijNIyvSfrtjtiEVrj0kxDbfaY+ExKT
         S5DCBpVsRIsn3n7OmhoxhBZ2HYrO2tv189HgUJWmO7wCJcpLLgs+TXtdnwB89i7oREl+
         bVaCOFRUFvKec6ZZ+32wyYO5lcjci9ktt29wYfSloA1IuJ9BrNjvCjoFwkZh/k/OZ9rQ
         TWACHfJtoez2REps42w6sKBP7786aGnvKGae62AysmEoW9BUPSijQNuBTaWxzHhysHeb
         AAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ryNqK5MU3hvexcP0lqXzZYDdmqazm1TBDaWSc1Bec88=;
        b=CPrCQzTjgOBY5GSHVYdXMGgR7WKx6X1FgHqZzSbpiN7/EnYqCy7q1sKjMWubIVE4lG
         HV/D8TcFxPQKJxkNJGnXaGd+TZDWy/JY1teXdjxcfSxKtWJRZ5JwVWad15/nWVPNMofw
         4bfcg85W29XKCz4O1oiCXC8oZDpLZxzUsLAn5QPGz1cNQr4aD8zVee/kwyQcWXYMLSHx
         sPcM1JvdtlMXmdXelHYvuI6bnWUuhmjgbwufedkjTl/klf4nDvxFHMCcrbsXNOd3ZiIq
         lbqGQzGLevQ11BVu6EsADzLrN09zUHWDi7qWbHJ6ifOReb004xxsF/3kaSI+uioFzbb4
         ITRw==
X-Gm-Message-State: ACgBeo0ePLSXjqawdwmD2AlkiMfHCSENVaxSt2dyyW2avZ09hQnLJaB/
	GG6WPGQ1VcM7LSKroZtQD0SR7Q==
X-Google-Smtp-Source: AA6agR60ZmA7z2Rw4x/+vVZJ8ouM6ug3aiG0VoToRr4xXb6X+ui1JU9//Z03osUcjGe8LanO+R1DlA==
X-Received: by 2002:a05:600c:1d1e:b0:3a5:4f8d:743f with SMTP id l30-20020a05600c1d1e00b003a54f8d743fmr2501614wms.121.1662648961741;
        Thu, 08 Sep 2022 07:56:01 -0700 (PDT)
Received: from fedora.fritz.box (p200300c1c7162d00e01b57df2fb57c15.dip0.t-ipconnect.de. [2003:c1:c716:2d00:e01b:57df:2fb5:7c15])
        by smtp.gmail.com with ESMTPSA id fc15-20020a05600c524f00b003a5260b8392sm3440304wmb.23.2022.09.08.07.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:56:01 -0700 (PDT)
From: Harald Hoyer <harald@profian.com>
To: ashish.kalra@amd.com
Cc: ak@linux.intel.com,
	alpergun@google.com,
	ardb@kernel.org,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dgilbert@redhat.com,
	dovmurik@linux.ibm.com,
	hpa@zytor.com,
	jarkko@kernel.org,
	jmattson@google.com,
	jroedel@suse.de,
	kirill@shutemov.name,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	luto@kernel.org,
	marcorr@google.com,
	michael.roth@amd.com,
	mingo@redhat.com,
	pbonzini@redhat.com,
	peterz@infradead.org,
	pgonda@google.com,
	rientjes@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	seanjc@google.com,
	slp@redhat.com,
	srinivas.pandruvada@linux.intel.com,
	tglx@linutronix.de,
	thomas.lendacky@amd.com,
	tobin@ibm.com,
	tony.luck@intel.com,
	vbabka@suse.cz,
	vkuznets@redhat.com,
	x86@kernel.org,
	Harald Hoyer <harald@profian.com>
Subject: [[PATCH for v6]] KVM: SEV: fix snp_launch_finish
Date: Thu,  8 Sep 2022 16:55:57 +0200
Message-Id: <20220908145557.1912158-1-harald@profian.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <6a513cf79bf71c479dbd72165faf1d804d77b3af.1655761627.git.ashish.kalra@amd.com>
References: <6a513cf79bf71c479dbd72165faf1d804d77b3af.1655761627.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `params.auth_key_en` indicator does _not_ specify, whether an
ID_AUTH struct should be sent or not, but, wheter the ID_AUTH struct
contains an author key or not. The firmware always expects an ID_AUTH block.

Link: https://lore.kernel.org/all/cover.1655761627.git.ashish.kalra@amd.com/
Signed-off-by: Harald Hoyer <harald@profian.com>
---
 arch/x86/kvm/svm/sev.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 85357dc4d231..5cf4be6a33ba 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2242,17 +2242,18 @@ static int snp_launch_finish(struct kvm *kvm, struct kvm_sev_cmd *argp)
 
 		data->id_block_en = 1;
 		data->id_block_paddr = __sme_pa(id_block);
-	}
 
-	if (params.auth_key_en) {
 		id_auth = psp_copy_user_blob(params.id_auth_uaddr, KVM_SEV_SNP_ID_AUTH_SIZE);
 		if (IS_ERR(id_auth)) {
 			ret = PTR_ERR(id_auth);
 			goto e_free_id_block;
 		}
 
-		data->auth_key_en = 1;
 		data->id_auth_paddr = __sme_pa(id_auth);
+
+		if (params.auth_key_en) {
+			data->auth_key_en = 1;
+		}
 	}
 
 	data->gctx_paddr = __psp_pa(sev->snp_context);
-- 
2.37.1

