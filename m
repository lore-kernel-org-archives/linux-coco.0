Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB06538D
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 21:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548D2C433D2;
	Thu, 26 Jan 2023 21:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674768342;
	bh=l0Zu8iIrldR2UdBT8hZ4gHGIUEy3EDsOun6BQFWhokg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t0YubjSrKMW8vSsWkSdr/4Myl+5dSI9ia2kr4LIeXQ1OQP2FM8Eh/dDexFNEwl5cG
	 8ufJH0uQn3UXphqct9gaEaImNF8ghCGQgqypnch95wp532zrbiUo8ZqMUt77kSYKHs
	 lhYV+gclqQzVbZ+fAPORNgX7uWeY+dWR9Sq8MhQ4rOL+TC8QjvYekGKZEGCNPpfv8b
	 di3MMIexrbGo1alA4a50vLYIMO/d1+gfiHhTAxhOvvkm8DsGHIzUdZLFjeIyuQMlhH
	 zSSPrODVBQCNwfYn5xedaFwqnlA8BeB/I0SxKkuY6VQVpmrxi/u63REoQtkqGnrN0h
	 VezmjkZ07iGmA==
Date: Thu, 26 Jan 2023 21:25:40 +0000
From: Jarkko Sakkinen <jarkko@kernel.org>
To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
	luto@kernel.org, dave.hansen@linux.intel.com, slp@redhat.com,
	pgonda@google.com, peterz@infradead.org,
	srinivas.pandruvada@linux.intel.com, rientjes@google.com,
	dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, dgilbert@redhat.com, harald@profian.com,
	Brijesh Singh <brijesh.singh@amd.com>,
	Pavan Kumar Paluri <papaluri@amd.com>
Subject: Re: [PATCH RFC v7 37/64] KVM: SVM: Add KVM_SNP_INIT command
Message-ID: <Y9Lv1HjD1FWdH9jg@kernel.org>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-38-michael.roth@amd.com>
 <Y7BG6pSuoZsBQYrx@kernel.org>
 <fd23ee51-ec47-717d-7cce-1d79db8b6bd3@amd.com>
 <16523f06-bb08-c4f9-bdfa-745fee553a43@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16523f06-bb08-c4f9-bdfa-745fee553a43@amd.com>

On Mon, Jan 23, 2023 at 04:49:14PM -0600, Kalra, Ashish wrote:
> There was an early firmware issue on Genoa which supported only SNP_INIT or
> SEV_INIT, but this issue is resolved now.
> 
> Now, the main constraints are that SNP_INIT is always required before
> SEV_INIT in case we want to launch SNP guests. In other words, if only
> SEV_INIT is done on a platform which supports SNP we won't be able to launch
> SNP guests after that.
> 
> So once we have RMP table setup (in BIOS) we will always do an SNP_INIT and
> SEV_INIT will be ideally done only (on demand) when an SEV guest is
> launched.

OK, thanks for the clarification!

BR, Jarkko
