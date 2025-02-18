Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA926B946
	for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739892178; cv=none; b=qLhvx1uJBtsDWkMkuixwSpP9gnH6ryOrTX1oxXiKnU1z/BwplcrFth6WfBUqD776WoAghstBfqbPAv04Y9X9gLUceD0RLQujUkUbXuK5x7M6Rpc7hxfa38tesRpaY3iL3qxBCyZr92YncW6g3GqMuGpL6DMG/vrnf95OKYMee+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739892178; c=relaxed/simple;
	bh=dRqns3tgs9LOzsvNykyA2wnDs4hZV04yHkHiuozwTo0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NKN4C+aoj03sA2SywZ8EpghqBdfvrshHCItqFiPlbC+WSUU/SQ8icZZXyPfoTVgPm38rlVMioxoMB/nbIEe6cmQW0LSHX626rGMOFASRqUWtTk0OWbTowtoZScayjUPuCMBA4vXQnVSutsSzWSgQoOSEb+0D9m7Wg1iarckMxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cezjFrPX; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cezjFrPX"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22112e86501so55630155ad.0
        for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 07:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739892176; x=1740496976; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4rBn1loiHVRgqEEQSp4qIiIQysoefBUpVmMVONI/VM=;
        b=cezjFrPXDdpLUiDWMmB+HMt9S49tMcMvVgc1ApcjCTL4pgqvTL256jAkarJaAVZzSK
         3bEsrB+LFWLtx100RRuFeeLRm0mTvrRFzGkeWy62MLRKfxpFrKrzELuRnAVngLPNJAvK
         w2664ivdoYYsWJrw8yx0kfhRlbbPYaxfzR/a0G421J/6GpP7iHBFRVXwA4yIiMvWCqG0
         Aqg3b93lbEyozspvJjJjjIHXIX8H8Ng41SaKNHBexo/iY6g8ZxBJrgzXE1aUAY8cy7a4
         0pvmRHlUDDsfOX0nJ6cgt9k0AtHV2kcyiCF8UU0j+6OGOhLtm0uD9Ea+9ySgDxRxwhks
         E2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892176; x=1740496976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4rBn1loiHVRgqEEQSp4qIiIQysoefBUpVmMVONI/VM=;
        b=lKPohaquE/p3wVbdZL6Zx8IXXN/CgKb+CobJNsmfAO6ZOLF2Yid/Dp3yMXnyTCiZn4
         j5h0qchVlMnyy052etAwrbMXY1tsa/ukgO23XGCti7s4pifzHCew7/1YX/ws/G30X+Q5
         v/jst5ger3DXKzfL6iHTrICXLzrzAWp8f1XkMz+V/r3CcQQlYyVHov2Pof373698s6iK
         wF/7hULT9aNqCPKaqWVZQahuzS4PzH2UkyHG+FdMF+h5ITw+GVbfm9LrJAQ4iDGO6y+y
         TyOkFIbdmy+JuoIlbp1aV6zu71AGZTLMhHyIiLDDw6rpBVMn9dhrxCooDtlLHHrn+i0w
         UTyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYpNrBV6XRkO5muX0YIPJYpKFNRpHV5sBO0pk+3QHs4nKkYWvom96pIU0tof0zBWWvHm5iPefsLiOI@lists.linux.dev
X-Gm-Message-State: AOJu0YzKUDTQgGkj7L2vmMjOnmk+aFI4E+rCMszPGyNNF0i9jXR2omVu
	ZwBlBq8tW2cMXDt7jp7XQ3IqJ6A+tbwN7bsFraKdschJ0PgOdwokWFm1cKzwQxB42arREgglwBC
	r9g==
X-Google-Smtp-Source: AGHT+IHtk8QhNUJ5IVao0gvIDKE2j52eZP0sIqAgCjZecx7PvM8TzFSmR+acBjaj46uiYVes4srTDuaJU+E=
X-Received: from pfbjt23.prod.google.com ([2002:a05:6a00:91d7:b0:730:8a7b:24e0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:790b:b0:1ee:a914:1d64
 with SMTP id adf61e73a8af0-1eea9142045mr14137360637.28.1739892176009; Tue, 18
 Feb 2025 07:22:56 -0800 (PST)
Date: Tue, 18 Feb 2025 07:22:54 -0800
In-Reply-To: <469ee330-7736-4059-9e59-ec7b9a6d3c8b@suse.cz>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250210063227.41125-1-shivankg@amd.com> <20250210063227.41125-3-shivankg@amd.com>
 <469ee330-7736-4059-9e59-ec7b9a6d3c8b@suse.cz>
Message-ID: <Z7Slzs_4jZ2qkPAi@google.com>
Subject: Re: [RFC PATCH v4 2/3] mm/mempolicy: export memory policy symbols
From: Sean Christopherson <seanjc@google.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org, willy@infradead.org, 
	pbonzini@redhat.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	chao.gao@intel.com, ackerleytng@google.com, david@redhat.com, bharata@amd.com, 
	nikunj@amd.com, michael.day@amd.com, Neeraj.Upadhyay@amd.com, 
	thomas.lendacky@amd.com, michael.roth@amd.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 17, 2025, Vlastimil Babka wrote:
> On 2/10/25 07:32, Shivank Garg wrote:
> > Export memory policy related symbols needed by the KVM guest-memfd to
> > implement NUMA policy support.
> > 
> > These symbols are required to implement per-memory region NUMA policies
> > for guest memory, allowing VMMs to control guest memory placement across
> > NUMA nodes.
> > 
> > Signed-off-by: Shivank Garg <shivankg@amd.com>
> 
> I think we should use EXPORT_SYMBOL_GPL() these days.
> 
> Wasn't there also some way to limit the exports to KVM?

The infrastructure is still a WIP[1], though when that lands, I definitely plan
on tightening down the KVM-induced exports[2].

[1] https://lore.kernel.org/all/20241202145946.108093528@infradead.org
[2] https://lore.kernel.org/all/ZzJOoFFPjrzYzKir@google.com
