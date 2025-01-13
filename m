Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD7522BAAC;
	Mon, 13 Jan 2025 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780412; cv=none; b=NFPkpcWkh3HX8LIZYWHLeIN1NU7CL/IHK1DYzIOAKkF7hFFxr0i0FeA254MnKXGJIwD73pLUwZYGcwLgfsi2PnntCN3mSKuxbj753ZQ3uG79AOTwgV4tYDg4wesUAjlqHLpf7DiONohgTVkMS3vtTBxj1kangQgoe8xVWGoQgdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780412; c=relaxed/simple;
	bh=hyIe+8nbGJQu/Fse4Df0AyHBn76OJIZggzC/bOhsu2c=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=lFHDCtT4yRaM4x/UUCSHEqLXuD2qhmAU3Ra5nLWIPvHNZauJwED8VHhIfMmQcfEv+d5Kw0FHpN+KEwW6Kk0FHqwOTtEN9AeCYkEePtHdUDyvkiKRbJp2DZ0jMkvmuJyRl2i0wV4QR7LZ19iFruLglPjK/tTU6W6SI5kW9UHv15k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:35590)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tXLv7-00Admf-N7; Mon, 13 Jan 2025 08:00:02 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:55228 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tXLv6-000swr-IG; Mon, 13 Jan 2025 08:00:01 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Baoquan He <bhe@redhat.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 akpm@linux-foundation.org,  kexec@lists.infradead.org,
 Yan Zhao <yan.y.zhao@intel.com>,  linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev,  x86@kernel.org,
 rick.p.edgecombe@intel.com,  kirill.shutemov@linux.intel.com,
 <security@kernel.org> 
References: <20241213094930.748-1-yan.y.zhao@intel.com>
	<xgycziy2o56hnom3oau7sbqed3meoni3razc6njj7ujatldnmm@s7odbl4splbn>
	<Z4T1G4dwzo7qdwSP@MiWiFi-R3L-srv>
Date: Mon, 13 Jan 2025 08:59:29 -0600
In-Reply-To: <Z4T1G4dwzo7qdwSP@MiWiFi-R3L-srv> (Baoquan He's message of "Mon,
	13 Jan 2025 19:12:27 +0800")
Message-ID: <87zfjuoj3i.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1tXLv6-000swr-IG;;;mid=<87zfjuoj3i.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX18ro5uu5wQTqj8Qfoky/SpdstYY4sC8eAg=
X-Spam-Level: 
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
	*      [score: 0.2496]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.8 XM_B_SpammyWords2 Two or more commony used spammy words
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Baoquan He <bhe@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 398 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 4.0 (1.0%), b_tie_ro: 2.7 (0.7%), parse: 0.69
	(0.2%), extract_message_metadata: 3.7 (0.9%), get_uri_detail_list: 2.3
	(0.6%), tests_pri_-2000: 3.1 (0.8%), tests_pri_-1000: 2.1 (0.5%),
	tests_pri_-950: 1.12 (0.3%), tests_pri_-900: 0.86 (0.2%),
	tests_pri_-90: 53 (13.4%), check_bayes: 52 (13.1%), b_tokenize: 6
	(1.5%), b_tok_get_all: 7 (1.8%), b_comp_prob: 2.4 (0.6%),
	b_tok_touch_all: 33 (8.4%), b_finish: 0.70 (0.2%), tests_pri_0: 311
	(78.3%), check_dkim_signature: 0.41 (0.1%), check_dkim_adsp: 2.6
	(0.6%), poll_dns_idle: 1.15 (0.3%), tests_pri_10: 1.84 (0.5%),
	tests_pri_500: 8 (2.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 0/1] Accept unaccepted kexec segments' destination
 addresses
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: security@kernel.org, kirill.shutemov@linux.intel.com, rick.p.edgecombe@intel.com, x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, kexec@lists.infradead.org, akpm@linux-foundation.org, kirill@shutemov.name, bhe@redhat.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Baoquan He <bhe@redhat.com> writes:

> On 01/13/25 at 12:01pm, Kirill A. Shutemov wrote:
>> On Fri, Dec 13, 2024 at 05:49:30PM +0800, Yan Zhao wrote:
>> > Hi Eric,
>> > 
>> > This is a repost of the patch "kexec_core: Accept unaccepted kexec
>> > destination addresses" [1], rebased to v6.13-rc2.
>> 
>> Can we get this patch applied?
>
> This looks good to me. In v1, we have analyzed all other possible
> solutions, however change in this patch seems the simplest and most
> accepatable one.

Truly?  I will go back and look and see what I missed but I haven't seen
anything that I addressed my original objections.

To repeat my objection.  The problem I saw was that the performance of
the accepted memory paradigm was so terrible that they had to resort to
lazily ``accepting'' memory, which leads to hacks in kexec.  I would not
like to included hacks in kexec just so that other people can avoid
fixing their bugs.

I did see a coherent explanation of the bad performance that pointed the
finger squarely at the fact that everything is happening a page at a
time.  AKA that the design of the ACPI interface has a flaw that needs
to be fixed.

I really don't think we should be making complicated work-arounds for
someone else's bad software decision just because someone immortalized
their bad decision in a standard.  Just accepting all of memory and
letting the folks who made the bad decision deal with the consequences
seems much more reasonable to me.

> If Eric has no objection, maybe Andrew can help pick this into his
> tree.

I have a new objection.  I believe ``unaccepted memory'' and especially
lazily initialized ``unaccepted memory'' is an information leak that
could defeat the purpose of encrypted memory.  For that reason I have
Cc'd the security list.  I don't know who to CC to get expertise on this
issue, and the security list folks should.

Unless I am misunderstanding things the big idea with encrypted
memory is that the hypervisor won't be able to figure out what you
are doing, because it can't read your memory.

My concern is that by making the ``acceptance'' of memory lazy, that
there is a fairly strong indication of the function of different parts
of memory.  I expect that signal is strong enough to defeat whatever
elements of memory address randomization that we implement in the
kernel.

So not only does it appear to me that implementation of ``accepting''
memory has a stupidly slow implementation, somewhat enshrined by a bad
page at a time ACPI standard, but it appears to me that lazily
``accepting'' that memory probably defeats the purpose of having
encrypted memory.

I think the actual solution is to remove all code except for the
"accept_memory=eager" code paths.  AKA delete the "accept_memory=lazy"
code.  At that point there are no more changes that need to be made to
kexec.

Eric
